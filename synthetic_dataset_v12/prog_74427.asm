; DESCRIPTION: Creates a purple circular shape at (91, 95) with radius 42.
; PLAN: r0=91(x), r1=95(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 95
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
