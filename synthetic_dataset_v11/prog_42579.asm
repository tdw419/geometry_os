; DESCRIPTION: Composite: . Then Renders a blue disk with center (99, 174) and radius 65. Then Creates a purple rectangular region at (124, 24) spanning 104 by 89 pixels.
; PLAN: r0=99(x), r1=174(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x), r1=24(y), r2=104(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (99, 174) and radius 65.
; PLAN: r0=99(x), r1=174(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 174
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (124, 24) spanning 104 by 89 pixels.
; PLAN: r0=124(x), r1=24(y), r2=104(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 24
LDI r2, 104
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
