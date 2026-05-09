; DESCRIPTION: Creates a green rectangular region at (230, 136) spanning 105 by 15 pixels.
; PLAN: r0=230(x), r1=136(y), r2=105(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 136
LDI r2, 105
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
