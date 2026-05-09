; DESCRIPTION: Places a green circle of radius 36 at center (210, 118).
; PLAN: r0=210(x), r1=118(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 118
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
