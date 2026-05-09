; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (47, 20) spanning 57 by 84 pixels. Then Renders a purple disk with center (184, 85) and radius 67.
; PLAN: r0=47(x), r1=20(y), r2=57(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=184(x), r1=85(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a blue rectangular region at (47, 20) spanning 57 by 84 pixels.
; PLAN: r0=47(x), r1=20(y), r2=57(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 20
LDI r2, 57
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (184, 85) and radius 67.
; PLAN: r0=184(x), r1=85(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 85
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
