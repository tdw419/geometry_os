; DESCRIPTION: Renders a green disk with center (171, 138) and radius 72.
; PLAN: r0=171(x), r1=138(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 138
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
