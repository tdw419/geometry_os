; DESCRIPTION: Creates a green rectangular region at (330, 19) spanning 14 by 119 pixels.
; PLAN: r0=330(x), r1=19(y), r2=14(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 19
LDI r2, 14
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
