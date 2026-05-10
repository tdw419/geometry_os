; DESCRIPTION: Renders a purple rectangular region spanning 44 by 34 at (209, 71).
; PLAN: r0=209(x), r1=71(y), r2=44(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 71
LDI r2, 44
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
