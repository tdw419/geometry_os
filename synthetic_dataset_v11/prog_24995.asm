; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (51, 45) spanning 96 by 26 pixels. Then Renders a magenta disk with center (155, 68) and radius 66.
; PLAN: r0=51(x), r1=45(y), r2=96(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=155(x), r1=68(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a purple rectangular region at (51, 45) spanning 96 by 26 pixels.
; PLAN: r0=51(x), r1=45(y), r2=96(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 45
LDI r2, 96
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (155, 68) and radius 66.
; PLAN: r0=155(x), r1=68(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 68
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
