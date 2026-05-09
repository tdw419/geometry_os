; DESCRIPTION: Renders a green line between points (200, 97) and (27, 140).
; PLAN: r0=200(x1), r1=97(y1), r2=27(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 97
LDI r2, 27
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
