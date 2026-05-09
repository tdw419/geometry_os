; DESCRIPTION: Creates a green rectangular region at (24, 40) spanning 84 by 27 pixels.
; PLAN: r0=24(x), r1=40(y), r2=84(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 40
LDI r2, 84
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
