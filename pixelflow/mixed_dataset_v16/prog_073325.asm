; DESCRIPTION: Renders a red disk with center (110, 184) and radius 55.
; PLAN: r0=110(x), r1=184(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 184
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
