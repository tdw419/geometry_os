; DESCRIPTION: Creates a green rectangular region at (361, 2) spanning 88 by 94 pixels.
; PLAN: r0=361(x), r1=2(y), r2=88(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 2
LDI r2, 88
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
