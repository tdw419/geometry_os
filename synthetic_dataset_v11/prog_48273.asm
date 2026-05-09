; DESCRIPTION: Composite: . Then Places a blue circle of radius 42 at center (200, 78). Then Creates a purple rectangular region at (37, 51) spanning 72 by 94 pixels.
; PLAN: r0=200(x), r1=78(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=37(x), r1=51(y), r2=72(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 42 at center (200, 78).
; PLAN: r0=200(x), r1=78(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 78
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (37, 51) spanning 72 by 94 pixels.
; PLAN: r0=37(x), r1=51(y), r2=72(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 51
LDI r2, 72
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
