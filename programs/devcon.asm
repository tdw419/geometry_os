;; ──────────────────────────────────────────────────────────────
;; devcon.asm — Developer Console for VEC↔Mailbox↔Hypervisor
;; Canvas: 32 cols x 128 rows at RAM[0x8000]
;; ──────────────────────────────────────────────────────────────

;; r14 = temp compare, r15 = address temp
;; r18 = canvas cursor, r19 = char temp
;; r20 = ring write_off, r21 = ring read_off, r22 = ring walk
;; r23 = digit counter

:main
  ;; ── Clear rows 0-15 (512 cells) ──
  LDI r16, 0
:clr
  LDI r17, 0x20
  LDI r18, 0x8000
  ADD r18, r16
  STORE r18, r17
  ADDI r16, 1
  LDI r17, 512
  CMP r16, r17
  BLT r0, :clr

  ;; ── Row 0: Title ──
  LDI r18, 0x8000
  STRO r18, "DEVCON v1"

  ;; ── Row 2: VEC_FIND results ──
  LDI r18, 0x8040
  STRO r18, "IDX:"
  ADDI r18, 4
  LDI r15, 0x2300
  LOAD r17, r15
  CALL :print_dec
  LDI r16, 0x20
  STORE r18, r16
  ADDI r18, 1
  STRO r18, "RING:"
  ADDI r18, 5
  LDI r15, 0x2301
  LOAD r17, r15
  CALL :print_dec
  LDI r16, 0x20
  STORE r18, r16
  ADDI r18, 1
  STRO r18, "ANG:"
  ADDI r18, 4
  LDI r15, 0x2302
  LOAD r17, r15
  CALL :print_dec

  ;; ── Row 3: RAM size from ring value ──
  LDI r18, 0x8060
  STRO r18, "RAM="
  ADDI r18, 4
  LDI r15, 0x2301
  LOAD r17, r15
  LDI r14, 0
  CMP r17, r14
  JNZ r0, :r1
  LDI r17, 64
  JMP :rdone
:r1
  LDI r14, 1
  CMP r17, r14
  JNZ r0, :r2
  LDI r17, 256
  JMP :rdone
:r2
  LDI r14, 2
  CMP r17, r14
  JNZ r0, :r3
  LDI r17, 512
  JMP :rdone
:r3
  LDI r17, 768
:rdone
  CALL :print_dec
  STRO r18, " MB"

  ;; ── Row 4: DTB offset from angle ──
  LDI r18, 0x8080
  STRO r18, "DTB=0x"
  ADDI r18, 6
  LDI r15, 0x2302
  LOAD r17, r15
  LDI r14, 0
  CMP r17, r14
  JNZ r0, :d1
  LDI r17, 0x200000
  JMP :ddone
:d1
  LDI r14, 1
  CMP r17, r14
  JNZ r0, :d2
  LDI r17, 0x400000
  JMP :ddone
:d2
  LDI r17, 0x800000
:ddone
  CALL :print_hex

  ;; ══════════════════════════════════════════════════════════
  ;;  Mailbox section
  ;; ══════════════════════════════════════════════════════════

  LDI r1, 0xE004
  LDI r2, 1
  LDI r3, 0x2400
  IOCTL r1, r2, r3
  LDI r15, 0x2303
  STORE r15, r0

  ;; Row 6: "--- Mailbox ---"
  LDI r18, 0x80C0
  STRO r18, "--- Mailbox ---"

  ;; Row 7: "RAM: NNN MB"
  LDI r18, 0x80E0
  STRO r18, "RAM: "
  ADDI r18, 5
  LDI r15, 0x2400
  LOAD r17, r15
  CALL :print_dec
  LDI r16, 0x20
  STORE r18, r16
  ADDI r18, 1
  LDI r16, 0x4D
  STORE r18, r16
  ADDI r18, 1
  LDI r16, 0x42
  STORE r18, r16
  ADDI r18, 1

  ;; Row 8: "DTB: 0xNNNNNNNN"
  LDI r18, 0x8100
  STRO r18, "DTB: 0x"
  ADDI r18, 7
  LDI r15, 0x2401
  LOAD r17, r15
  CALL :print_hex

  ;; Row 9: "INIT: 0xNNNNNNNN (NN)"
  LDI r18, 0x8120
  STRO r18, "INIT: 0x"
  ADDI r18, 7
  LDI r15, 0x2402
  LOAD r17, r15
  CALL :print_hex
  LDI r16, 0x20
  STORE r18, r16
  ADDI r18, 1
  LDI r16, 0x28
  STORE r18, r16
  ADDI r18, 1
  LDI r15, 0x2403
  LOAD r17, r15
  CALL :print_dec
  LDI r16, 0x29
  STORE r18, r16
  ADDI r18, 1

  ;; Row 10: "ARGS: 0xNNNNNNNN"
  LDI r18, 0x8140
  STRO r18, "ARGS: 0x"
  ADDI r18, 7
  LDI r15, 0x2404
  LOAD r17, r15
  CALL :print_hex

  ;; Row 11: "IOCTL: NNN"
  LDI r18, 0x8160
  STRO r18, "IOCTL: "
  ADDI r18, 7
  LDI r15, 0x2303
  LOAD r17, r15
  CALL :print_dec
  LDI r15, 0x2303
  LOAD r17, r15
  LDI r14, 0
  CMP r17, r14
  JNZ r0, :no_ok
  LDI r16, 0x20
  STORE r18, r16
  ADDI r18, 1
  LDI r16, 0x4F
  STORE r18, r16
  ADDI r18, 1
  LDI r16, 0x4B
  STORE r18, r16
:no_ok

  ;; ══════════════════════════════════════════════════════════
  ;;  Console from ring buffer
  ;; ══════════════════════════════════════════════════════════

  ;; Row 13: "--- Console ---"
  LDI r18, 0x81A0
  STRO r18, "--- Console ---"

  LDI r15, 0x4F00
  LOAD r20, r15
  LDI r15, 0x4F01
  LOAD r21, r15
  CMP r20, r21
  JZ r0, :done

  LDI r18, 0x81C0
  MOV r22, r21

:cloop
  CMP r22, r20
  JZ r0, :done

  LDI r15, 0x4F02
  ADD r15, r22
  LOAD r19, r15

  LDI r14, 0x0A
  CMP r19, r14
  JZ r0, :cnl
  LDI r14, 0x0D
  CMP r19, r14
  JZ r0, :ccr
  LDI r14, 0x20
  CMP r19, r14
  BLT r0, :cnext

  STORE r18, r19
  ADDI r18, 1
  JMP :cnext

:cnl
  SUBI r18, 0x8000
  LDI r16, 32
  DIV r17, r18, r16
  ADDI r17, 1
  MUL r18, r17, r16
  ADDI r18, 0x8000
  JMP :cnext

:ccr
  SUBI r18, 0x8000
  LDI r16, 32
  DIV r17, r18, r16
  MUL r18, r17, r16
  ADDI r18, 0x8000
  JMP :cnext

:cnext
  ADDI r22, 1
  LDI r16, 254
  CMP r22, r16
  BLT r0, :cloop
  LDI r22, 0
  JMP :cloop

:done
  HALT

;; ══════════════════════════════════════════════════════════════
;;  print_hex: r17=value, r18=cursor (advances 8)
;; ══════════════════════════════════════════════════════════════
:print_hex
  MOV r20, r17
  LDI r23, 28
:ph_loop
  MOV r17, r20
  SHR r17, r23
  ANDI r17, 0xF
  LDI r16, 0x30
  ADD r16, r17
  LDI r17, 0x3A
  CMP r16, r17
  BLT r0, :ph_wr
  ADDI r16, 7
:ph_wr
  STORE r18, r16
  ADDI r18, 1
  SUBI r23, 4
  LDI r14, 0
  CMP r23, r14
  JNZ r0, :ph_loop
  RET

;; ══════════════════════════════════════════════════════════════
;;  print_dec: r17=value, r18=cursor (advances)
;; ══════════════════════════════════════════════════════════════
:print_dec
  MOV r20, r17
  LDI r19, 0x2600
  ADDI r19, 18
:pd_loop
  LDI r16, 10
  DIV r21, r20, r16
  MUL r22, r21, r16
  SUB r22, r20, r22
  ADDI r22, 0x30
  SUBI r19, 1
  STORE r19, r22
  MOV r20, r21
  LDI r14, 0
  CMP r20, r14
  JNZ r0, :pd_loop
:pd_wr
  LOAD r17, r19
  LDI r14, 0
  CMP r17, r14
  JZ r0, :pd_done
  STORE r18, r17
  ADDI r18, 1
  ADDI r19, 1
  JMP :pd_wr
:pd_done
  RET