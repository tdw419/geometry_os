; DESCRIPTION: Creates a green rectangular region at (19, 48) spanning 112 by 84 pixels.
; PLAN: r0=19(x), r1=48(y), r2=112(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 48
LDI r2, 112
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
