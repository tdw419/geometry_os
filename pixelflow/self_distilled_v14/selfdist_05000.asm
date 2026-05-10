; DESCRIPTION: Renders a yellow rectangular region spanning 68 by 14 at (229, 52).
; PLAN: r0=229(x), r1=52(y), r2=68(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 52
LDI r2, 68
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
