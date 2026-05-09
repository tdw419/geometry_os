; DESCRIPTION: Renders a blue disk with center (434, 138) and radius 46.
; PLAN: r0=434(x), r1=138(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 138
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
