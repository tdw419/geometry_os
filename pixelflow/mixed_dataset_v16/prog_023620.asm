; DESCRIPTION: Renders a purple disk with center (207, 126) and radius 31.
; PLAN: r0=207(x), r1=126(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 126
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
