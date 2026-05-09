; DESCRIPTION: Renders a green disk with center (145, 143) and radius 55.
; PLAN: r0=145(x), r1=143(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 143
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
