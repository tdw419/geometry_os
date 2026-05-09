; DESCRIPTION: Places a green circle of radius 72 at center (82, 86).
; PLAN: r0=82(x), r1=86(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 86
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
