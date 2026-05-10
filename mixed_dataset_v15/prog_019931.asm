; DESCRIPTION: Renders a blue rectangular region spanning 73 by 33 at (267, 34).
; PLAN: r0=267(x), r1=34(y), r2=73(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 34
LDI r2, 73
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
