; DESCRIPTION: Renders a purple rectangular region spanning 94 by 40 at (355, 192).
; PLAN: r0=355(x), r1=192(y), r2=94(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 192
LDI r2, 94
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
