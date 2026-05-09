; DESCRIPTION: Places a green circle of radius 61 at center (71, 134).
; PLAN: r0=71(x), r1=134(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 134
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
