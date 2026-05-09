; DESCRIPTION: Creates a green rectangular region at (144, 77) spanning 12 by 105 pixels.
; PLAN: r0=144(x), r1=77(y), r2=12(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 77
LDI r2, 12
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
