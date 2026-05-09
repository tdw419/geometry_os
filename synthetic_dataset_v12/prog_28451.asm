; DESCRIPTION: Places a green circle of radius 36 at center (323, 125).
; PLAN: r0=323(x), r1=125(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 125
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
