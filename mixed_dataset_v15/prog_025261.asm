; DESCRIPTION: Renders a yellow disk with center (229, 143) and radius 69.
; PLAN: r0=229(x), r1=143(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 143
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
