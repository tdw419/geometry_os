; DESCRIPTION: Creates a green rectangular region at (187, 200) spanning 28 by 52 pixels.
; PLAN: r0=187(x), r1=200(y), r2=28(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 200
LDI r2, 28
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
