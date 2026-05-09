; DESCRIPTION: Creates a purple circular shape at (303, 135) with radius 42.
; PLAN: r0=303(x), r1=135(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 135
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
