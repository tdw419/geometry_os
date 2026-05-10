; DESCRIPTION: Renders a purple rectangular region spanning 107 by 46 at (140, 56).
; PLAN: r0=140(x), r1=56(y), r2=107(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 56
LDI r2, 107
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
