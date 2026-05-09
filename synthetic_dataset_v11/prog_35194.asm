; DESCRIPTION: Composite: . Then Places a white 118x21 rectangle at position (64, 93). Then Creates a purple circular shape at (145, 113) with radius 76.
; PLAN: r0=64(x), r1=93(y), r2=118(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=145(x), r1=113(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white 118x21 rectangle at position (64, 93).
; PLAN: r0=64(x), r1=93(y), r2=118(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 93
LDI r2, 118
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (145, 113) with radius 76.
; PLAN: r0=145(x), r1=113(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 113
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
