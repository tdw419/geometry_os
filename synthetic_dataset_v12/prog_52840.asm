; DESCRIPTION: Creates a blue rectangular region at (427, 99) spanning 50 by 81 pixels.
; PLAN: r0=427(x), r1=99(y), r2=50(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 99
LDI r2, 50
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
