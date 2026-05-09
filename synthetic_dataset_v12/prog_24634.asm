; DESCRIPTION: Creates a green rectangular region at (144, 196) spanning 90 by 20 pixels.
; PLAN: r0=144(x), r1=196(y), r2=90(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 196
LDI r2, 90
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
