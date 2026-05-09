; DESCRIPTION: Creates a green rectangular region at (212, 7) spanning 89 by 36 pixels.
; PLAN: r0=212(x), r1=7(y), r2=89(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 7
LDI r2, 89
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
