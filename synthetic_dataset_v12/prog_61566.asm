; DESCRIPTION: Renders a green disk with center (303, 116) and radius 33.
; PLAN: r0=303(x), r1=116(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 116
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
