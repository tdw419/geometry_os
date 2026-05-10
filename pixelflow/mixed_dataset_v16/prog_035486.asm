; DESCRIPTION: Creates a green rectangular region at (420, 91) spanning 71 by 52 pixels.
; PLAN: r0=420(x), r1=91(y), r2=71(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 91
LDI r2, 71
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
