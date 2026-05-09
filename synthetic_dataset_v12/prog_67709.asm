; DESCRIPTION: Renders a green disk with center (449, 229) and radius 20.
; PLAN: r0=449(x), r1=229(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 229
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
