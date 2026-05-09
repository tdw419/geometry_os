; DESCRIPTION: Renders a black line between points (397, 245) and (454, 25).
; PLAN: r0=397(x1), r1=245(y1), r2=454(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 245
LDI r2, 454
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
