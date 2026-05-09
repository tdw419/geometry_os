; DESCRIPTION: Composite: . Then Creates a red rectangular region at (106, 105) spanning 45 by 118 pixels. Then Renders a black disk with center (88, 140) and radius 66.
; PLAN: r0=106(x), r1=105(y), r2=45(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=88(x), r1=140(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (106, 105) spanning 45 by 118 pixels.
; PLAN: r0=106(x), r1=105(y), r2=45(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 105
LDI r2, 45
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (88, 140) and radius 66.
; PLAN: r0=88(x), r1=140(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 140
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
