; DESCRIPTION: Creates a purple circular shape at (146, 151) with radius 65.
; PLAN: r0=146(x), r1=151(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 151
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
