; DESCRIPTION: Places a red disk with center (68, 69) and radius 48.
; PLAN: r0=68(x), r1=69(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 69
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
