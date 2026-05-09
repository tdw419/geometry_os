; DESCRIPTION: Renders a green line between points (359, 162) and (7, 25).
; PLAN: r0=359(x1), r1=162(y1), r2=7(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 162
LDI r2, 7
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
