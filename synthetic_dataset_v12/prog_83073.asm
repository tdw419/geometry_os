; DESCRIPTION: Creates a blue rectangular region at (331, 75) spanning 81 by 78 pixels.
; PLAN: r0=331(x), r1=75(y), r2=81(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 75
LDI r2, 81
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
