; DESCRIPTION: Creates a green rectangular region at (196, 20) spanning 22 by 22 pixels.
; PLAN: r0=196(x), r1=20(y), r2=22(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 20
LDI r2, 22
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
