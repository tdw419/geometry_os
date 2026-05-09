; DESCRIPTION: Renders a red disk with center (66, 65) and radius 64.
; PLAN: r0=66(x), r1=65(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 65
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
