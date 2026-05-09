; DESCRIPTION: Renders a purple disk with center (43, 207) and radius 42.
; PLAN: r0=43(x), r1=207(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 207
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
