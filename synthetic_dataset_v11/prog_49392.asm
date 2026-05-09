; DESCRIPTION: Composite: . Then Places a black 24x73 rectangle at position (83, 42). Then Creates a purple circular shape at (52, 48) with radius 48.
; PLAN: r0=83(x), r1=42(y), r2=24(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=52(x), r1=48(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 24x73 rectangle at position (83, 42).
; PLAN: r0=83(x), r1=42(y), r2=24(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 42
LDI r2, 24
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (52, 48) with radius 48.
; PLAN: r0=52(x), r1=48(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 48
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
