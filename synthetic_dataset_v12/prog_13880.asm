; DESCRIPTION: Renders a magenta disk with center (438, 188) and radius 25.
; PLAN: r0=438(x), r1=188(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 188
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
