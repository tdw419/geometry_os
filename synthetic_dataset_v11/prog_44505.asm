; DESCRIPTION: Composite: . Then Places a black circle of radius 66 at center (114, 186). Then Creates a blue rectangular region at (49, 32) spanning 118 by 81 pixels.
; PLAN: r0=114(x), r1=186(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x), r1=32(y), r2=118(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 66 at center (114, 186).
; PLAN: r0=114(x), r1=186(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 186
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (49, 32) spanning 118 by 81 pixels.
; PLAN: r0=49(x), r1=32(y), r2=118(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 32
LDI r2, 118
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
