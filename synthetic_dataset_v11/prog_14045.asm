; DESCRIPTION: Creates a yellow rectangular region at (11, 75) spanning 89 by 111 pixels.
; PLAN: r0=11(x), r1=75(y), r2=89(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 75
LDI r2, 89
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
