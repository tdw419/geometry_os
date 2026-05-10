; DESCRIPTION: Renders a blue rectangular region spanning 114 by 54 at (157, 36).
; PLAN: r0=157(x), r1=36(y), r2=114(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 36
LDI r2, 114
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
