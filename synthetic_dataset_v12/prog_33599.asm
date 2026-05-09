; DESCRIPTION: Places a black circle of radius 54 at center (363, 127).
; PLAN: r0=363(x), r1=127(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 127
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
