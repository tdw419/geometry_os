; DESCRIPTION: Renders a cyan disk with center (163, 198) and radius 58.
; PLAN: r0=163(x), r1=198(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 198
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
