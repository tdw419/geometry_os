; DESCRIPTION: Places a red disk with center (66, 44) and radius 69.
; PLAN: r0=66(x), r1=44(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 44
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
