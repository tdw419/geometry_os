; DESCRIPTION: Places a green circle of radius 25 at center (168, 188).
; PLAN: r0=168(x), r1=188(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 188
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
