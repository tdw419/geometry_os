; DESCRIPTION: Renders a orange rectangular region spanning 97 by 102 at (216, 97).
; PLAN: r0=216(x), r1=97(y), r2=97(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 97
LDI r2, 97
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
