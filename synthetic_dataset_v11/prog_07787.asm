; DESCRIPTION: Places a green circle of radius 74 at center (176, 143).
; PLAN: r0=176(x), r1=143(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 143
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
