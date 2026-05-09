; DESCRIPTION: Renders a green disk with center (179, 128) and radius 68.
; PLAN: r0=179(x), r1=128(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 128
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
