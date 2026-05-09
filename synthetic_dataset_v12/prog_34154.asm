; DESCRIPTION: Places a blue circle of radius 42 at center (126, 183).
; PLAN: r0=126(x), r1=183(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 183
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
