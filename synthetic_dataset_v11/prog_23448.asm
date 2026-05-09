; DESCRIPTION: Renders a green disk with center (168, 117) and radius 44.
; PLAN: r0=168(x), r1=117(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 117
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
