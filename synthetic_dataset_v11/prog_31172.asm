; DESCRIPTION: Creates a green rectangular region at (92, 13) spanning 52 by 89 pixels.
; PLAN: r0=92(x), r1=13(y), r2=52(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 13
LDI r2, 52
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
