; DESCRIPTION: Creates a yellow rectangular region at (8, 4) spanning 89 by 52 pixels.
; PLAN: r0=8(x), r1=4(y), r2=89(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 4
LDI r2, 89
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
