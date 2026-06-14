; Geometry OS Spatial Labeler v2
; Scans addresses 0x1001..0x102D, classifies non-zero values via NEURAL_EVAL
; Draws yellow pixels on indexed positions

main:
    LDI r10, 0x1001     ; Start of scan range
    LDI r11, 0x102D     ; End of scan range
    LDI r12, 0x8000     ; Metadata storage base

loop:
    LOAD r1, r10        ; Read seed value at this address

    ; Skip if zero
    JZ r1, skip

    ; Classify via neural eval
    LDI r2, weights
    NEURAL_EVAL r3, r1, r2

    ; Store result in metadata table
    STORE r12, r3

    ; Draw yellow marker at this position
    HILBERT_D2XY r4, r5, r10
    LDI r6, 0xFFFF00
    PSET r4, r5, r6

skip:
    ADDI r10, 1
    ADDI r12, 1
    SUB r7, r11, r10
    JNZ r7, loop

done:
    FRAME
    HALT

weights:
    .byte 0x3F, 0x00, 0x00, 0x00
