; DESCRIPTION: Renders a purple disk with center (121, 103) and radius 42.
; PLAN: r0=121(x), r1=103(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 103
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
