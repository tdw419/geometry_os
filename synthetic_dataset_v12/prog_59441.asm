; DESCRIPTION: Renders a yellow line between points (397, 31) and (251, 91).
; PLAN: r0=397(x1), r1=31(y1), r2=251(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 31
LDI r2, 251
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
