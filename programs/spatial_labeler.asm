; Geometry OS Native Spatial Labeler
; Corrected for RAM addressing and direct loop

.org 0x1000
:main
    LDI r10, 0x1005     ; Start of Data Zone (After this code)
    LDI r11, 0x102D     ; End of Data Zone
    LDI r12, 0x8000     ; Metadata RAM

:loop
    LOAD r1, r10      ; Read fragment seed
    JZ r1, :skip
    
    ; Simple threshold detect
    LDI r2, 100
    MOV r3, r1
    SUB r3, r2
    JNZ r3, :is_hot
    LDI r3, 0x1         ; Cold Tag
    JMP :store

:is_hot
    LDI r3, 0x2         ; Hot Tag

:store
    STORE r12, r3     ; Write metadata
    ADDI r12, 1          ; Next RAM slot

:skip
    ADDI r10, 1          ; Next fragment
    MOV r7, r10
    SUB r7, r11
    JNZ r7, :loop

:done
    HALT
