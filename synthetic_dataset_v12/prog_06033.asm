; DESCRIPTION: Renders a red disk with center (385, 30) and radius 16.
; PLAN: r0=385(x), r1=30(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 30
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
