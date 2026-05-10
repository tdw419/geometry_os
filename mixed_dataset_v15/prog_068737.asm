; DESCRIPTION: Places a red disk with center (286, 68) and radius 58.
; PLAN: r0=286(x), r1=68(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 68
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
