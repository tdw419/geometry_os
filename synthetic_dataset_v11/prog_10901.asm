; DESCRIPTION: Renders a purple disk with center (167, 141) and radius 42.
; PLAN: r0=167(x), r1=141(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 141
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
