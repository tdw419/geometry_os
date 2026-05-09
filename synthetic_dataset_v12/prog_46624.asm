; DESCRIPTION: Renders a green disk with center (411, 160) and radius 29.
; PLAN: r0=411(x), r1=160(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 160
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
