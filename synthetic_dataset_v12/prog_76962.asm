; DESCRIPTION: Renders a blue disk with center (86, 236) and radius 16.
; PLAN: r0=86(x), r1=236(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 236
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
