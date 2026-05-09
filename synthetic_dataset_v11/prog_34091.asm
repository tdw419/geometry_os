; DESCRIPTION: Renders a green disk with center (27, 205) and radius 12.
; PLAN: r0=27(x), r1=205(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 205
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
