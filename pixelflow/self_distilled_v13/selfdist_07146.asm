; DESCRIPTION: Places a purple 16x107 box at position (369, 172).
; PLAN: r0=369(x), r1=172(y), r2=16(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 172
LDI r2, 16
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
