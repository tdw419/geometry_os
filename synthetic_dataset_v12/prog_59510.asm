; DESCRIPTION: Renders a green line between points (306, 141) and (473, 7).
; PLAN: r0=306(x1), r1=141(y1), r2=473(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 141
LDI r2, 473
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
