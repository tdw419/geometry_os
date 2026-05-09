; DESCRIPTION: Places a blue 28x81 rectangle at position (176, 77).
; PLAN: r0=176(x), r1=77(y), r2=28(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 77
LDI r2, 28
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
