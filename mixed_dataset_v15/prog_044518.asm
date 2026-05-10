; DESCRIPTION: Renders a green disk with center (168, 153) and radius 63.
; PLAN: r0=168(x), r1=153(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 153
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
