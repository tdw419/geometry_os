; DESCRIPTION: Renders a green disk with center (267, 77) and radius 64.
; PLAN: r0=267(x), r1=77(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 77
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
