; DESCRIPTION: Renders a purple disk with center (42, 68) and radius 37.
; PLAN: r0=42(x), r1=68(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 68
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
