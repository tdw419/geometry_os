; DESCRIPTION: Renders a green disk with center (280, 171) and radius 75.
; PLAN: r0=280(x), r1=171(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 171
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
