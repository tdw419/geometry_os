; DESCRIPTION: Renders a green disk with center (99, 126) and radius 68.
; PLAN: r0=99(x), r1=126(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 126
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
