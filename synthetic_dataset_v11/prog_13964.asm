; DESCRIPTION: Creates a purple circular shape at (126, 146) with radius 42.
; PLAN: r0=126(x), r1=146(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 146
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
