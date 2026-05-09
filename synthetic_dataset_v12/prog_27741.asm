; DESCRIPTION: Renders a red disk with center (385, 94) and radius 64.
; PLAN: r0=385(x), r1=94(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 94
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
