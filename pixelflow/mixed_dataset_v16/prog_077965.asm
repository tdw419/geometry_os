; DESCRIPTION: Renders a purple disk with center (365, 161) and radius 68.
; PLAN: r0=365(x), r1=161(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 161
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
