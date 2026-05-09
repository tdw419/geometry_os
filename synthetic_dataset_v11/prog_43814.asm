; DESCRIPTION: Places a green circle of radius 43 at center (109, 120).
; PLAN: r0=109(x), r1=120(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 120
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
