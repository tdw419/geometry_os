; DESCRIPTION: Renders a green disk with center (101, 179) and radius 25.
; PLAN: r0=101(x), r1=179(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 179
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
