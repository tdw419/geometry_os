; DESCRIPTION: Creates a green rectangular region at (232, 37) spanning 17 by 25 pixels.
; PLAN: r0=232(x), r1=37(y), r2=17(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 37
LDI r2, 17
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
