; DESCRIPTION: Renders a green line between points (66, 217) and (292, 76).
; PLAN: r0=66(x1), r1=217(y1), r2=292(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 217
LDI r2, 292
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
