; DESCRIPTION: Renders a green disk with center (68, 66) and radius 57.
; PLAN: r0=68(x), r1=66(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 66
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
