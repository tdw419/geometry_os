; DESCRIPTION: Renders a yellow line between points (397, 29) and (391, 77).
; PLAN: r0=397(x1), r1=29(y1), r2=391(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 29
LDI r2, 391
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
