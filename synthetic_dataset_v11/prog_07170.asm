; DESCRIPTION: Composite: . Then Places a blue circle of radius 77 at center (118, 150). Then Creates a purple rectangular region at (201, 24) spanning 40 by 84 pixels.
; PLAN: r0=118(x), r1=150(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=201(x), r1=24(y), r2=40(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 77 at center (118, 150).
; PLAN: r0=118(x), r1=150(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 150
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (201, 24) spanning 40 by 84 pixels.
; PLAN: r0=201(x), r1=24(y), r2=40(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 24
LDI r2, 40
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
