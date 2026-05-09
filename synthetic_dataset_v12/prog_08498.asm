; DESCRIPTION: Renders a green disk with center (182, 33) and radius 26.
; PLAN: r0=182(x), r1=33(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 33
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
