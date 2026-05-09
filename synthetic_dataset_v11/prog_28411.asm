; DESCRIPTION: Renders a yellow disk with center (167, 149) and radius 33.
; PLAN: r0=167(x), r1=149(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 149
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
