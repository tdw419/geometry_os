; DESCRIPTION: Places a yellow circle of radius 68 at center (403, 159).
; PLAN: r0=403(x), r1=159(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 159
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
