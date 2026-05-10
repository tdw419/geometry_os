; DESCRIPTION: Renders a purple disk with center (228, 102) and radius 79.
; PLAN: r0=228(x), r1=102(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 102
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
