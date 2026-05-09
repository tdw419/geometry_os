; DESCRIPTION: Creates a green rectangular region at (22, 200) spanning 100 by 45 pixels.
; PLAN: r0=22(x), r1=200(y), r2=100(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 200
LDI r2, 100
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
