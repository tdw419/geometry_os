; DESCRIPTION: Places a green circle of radius 58 at center (194, 174).
; PLAN: r0=194(x), r1=174(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 174
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
