; lib/time.asm -- Standard Library: time and delay utilities
;
; Version: 1.2.0
; Dependencies: none (base library)
; Clobbers: varies per function (see individual docs)
;
; Calling convention:
;   Arguments: r1-r5 (r0 = return value)
;   Caller-saved: r1-r9
;   Callee-saved: r10-r25 (ALL functions preserve these)
;
; Hardware tick counter: RAM[0xFFE] = ticks (incremented each scheduler tick)

; ═══════════════════════════════════════════════════════════════
; get_ticks -- read current tick counter
;   returns r0 = current tick count
;   clobbers: r9
; ═══════════════════════════════════════════════════════════════
get_ticks:
    LDI r9, 0xFFE
    LOAD r0, r9
    RET

; ═══════════════════════════════════════════════════════════════
; delay_ticks -- busy-wait for N ticks
;   r1 = number of ticks to wait
;   clobbers: r1, r8, r9 (uses PUSH/POP to preserve r10)
;   v1.2.0: Fixed callee-saved register violation (was clobbering r10)
; ═══════════════════════════════════════════════════════════════
delay_ticks:
    PUSH r10
    LDI r9, 0xFFE
    LOAD r10, r9           ; r10 = start ticks
    ADD r10, r1            ; r10 = target tick count
delay_loop:
    LOAD r8, r9            ; r8 = current ticks
    CMP r8, r10            ; compare current with target
    LDI r8, 0xFFFFFFFF
    CMP r0, r8             ; if CMP == -1, current < target, keep waiting
    JZ r0, delay_loop
    POP r10
    RET

; ═══════════════════════════════════════════════════════════════
; delay_frames -- busy-wait for N frames (using SLEEP)
;   r1 = number of frames to wait
;   clobbers: none
; ═══════════════════════════════════════════════════════════════
delay_frames:
    SLEEP r1
    RET
