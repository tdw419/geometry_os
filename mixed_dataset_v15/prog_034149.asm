; DESCRIPTION: Renders a green disk with center (278, 133) and radius 55.
; PLAN: r0=278(x), r1=133(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 133
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
