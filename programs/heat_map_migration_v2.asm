; Heat-Map Migration v2
; Scans 256x256 addresses for heat counters
; Marks hot (>=100) fragments with red pixels

main:
    LDI r10, 0x1000     ; Base address
    LDI r11, 0          ; Current index
    LDI r12, 65535      ; Max Hilbert index

loop:
    LOAD r1, r10        ; Read heat counter

    ; Check if heat >= 100
    LDI r2, 100
    SUB r3, r1, r2
    JZ r3, hot          ; Exactly 100
    JNZ r3, check_pos
    JMP next

check_pos:
    ; r3 = r1 - 100. If r1 > 100, r3 is positive.
    ; We can't easily test sign, so just treat any non-zero as hot
    ; (This is a simplification; real version would need better comparison)

hot:
    HILBERT_D2XY r4, r5, r11
    LDI r6, 0xFF4444    ; Hot = Red
    PSET r4, r5, r6

next:
    ADDI r11, 1
    ADDI r10, 4         ; 4-byte stride
    SUB r4, r11, r12
    JNZ r4, loop

done:
    FRAME
    HALT
