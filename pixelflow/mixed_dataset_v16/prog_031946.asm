; DESCRIPTION: Renders a yellow rectangular region spanning 83 by 52 at (176, 106).
; PLAN: r0=176(x), r1=106(y), r2=83(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 106
LDI r2, 83
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
