; DESCRIPTION: Composite: . Then Places a black circle of radius 48 at center (55, 175). Then Creates a blue rectangular region at (154, 19) spanning 90 by 72 pixels.
; PLAN: r0=55(x), r1=175(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=154(x), r1=19(y), r2=90(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 48 at center (55, 175).
; PLAN: r0=55(x), r1=175(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 175
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (154, 19) spanning 90 by 72 pixels.
; PLAN: r0=154(x), r1=19(y), r2=90(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 19
LDI r2, 90
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
