; DESCRIPTION: Renders a yellow rectangular region spanning 97 by 65 at (102, 5).
; PLAN: r0=102(x), r1=5(y), r2=97(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 5
LDI r2, 97
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
