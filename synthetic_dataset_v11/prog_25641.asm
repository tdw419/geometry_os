; DESCRIPTION: Creates a green rectangular region at (36, 160) spanning 23 by 20 pixels.
; PLAN: r0=36(x), r1=160(y), r2=23(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 160
LDI r2, 23
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
