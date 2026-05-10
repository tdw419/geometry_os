; DESCRIPTION: Renders a yellow rectangular region spanning 54 by 15 at (301, 112).
; PLAN: r0=301(x), r1=112(y), r2=54(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 112
LDI r2, 54
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
