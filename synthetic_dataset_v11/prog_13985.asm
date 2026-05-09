; DESCRIPTION: Composite: . Then Places a blue circle of radius 34 at center (191, 56). Then Creates a purple rectangular region at (20, 15) spanning 115 by 58 pixels.
; PLAN: r0=191(x), r1=56(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=20(x), r1=15(y), r2=115(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 34 at center (191, 56).
; PLAN: r0=191(x), r1=56(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 56
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (20, 15) spanning 115 by 58 pixels.
; PLAN: r0=20(x), r1=15(y), r2=115(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 15
LDI r2, 115
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
