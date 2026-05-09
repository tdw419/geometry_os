; DESCRIPTION: Renders a green line between points (397, 100) and (391, 216).
; PLAN: r0=397(x1), r1=100(y1), r2=391(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 100
LDI r2, 391
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
