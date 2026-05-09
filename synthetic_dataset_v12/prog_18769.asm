; DESCRIPTION: Renders a green disk with center (87, 135) and radius 45.
; PLAN: r0=87(x), r1=135(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 135
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
