; DESCRIPTION: Creates a green rectangular region at (138, 25) spanning 101 by 20 pixels.
; PLAN: r0=138(x), r1=25(y), r2=101(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 25
LDI r2, 101
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
