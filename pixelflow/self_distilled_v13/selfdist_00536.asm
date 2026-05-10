; DESCRIPTION: Renders a blue rectangular region spanning 18 by 73 at (37, 192).
; PLAN: r0=37(x), r1=192(y), r2=18(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 192
LDI r2, 18
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
