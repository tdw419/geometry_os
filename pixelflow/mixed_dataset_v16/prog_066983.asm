; DESCRIPTION: Renders a green line between points (91, 244) and (306, 216).
; PLAN: r0=91(x1), r1=244(y1), r2=306(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 244
LDI r2, 306
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
