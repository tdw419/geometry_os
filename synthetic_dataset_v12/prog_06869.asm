; DESCRIPTION: Places a black circle of radius 68 at center (403, 142).
; PLAN: r0=403(x), r1=142(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 142
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
