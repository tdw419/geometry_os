; DESCRIPTION: Creates a blue rectangular region at (267, 89) spanning 106 by 56 pixels.
; PLAN: r0=267(x), r1=89(y), r2=106(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 89
LDI r2, 106
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
