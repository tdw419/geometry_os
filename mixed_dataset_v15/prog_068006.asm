; DESCRIPTION: Renders a green disk with center (328, 211) and radius 36.
; PLAN: r0=328(x), r1=211(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 211
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
