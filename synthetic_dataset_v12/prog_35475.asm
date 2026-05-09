; DESCRIPTION: Renders a purple disk with center (162, 92) and radius 16.
; PLAN: r0=162(x), r1=92(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 92
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
