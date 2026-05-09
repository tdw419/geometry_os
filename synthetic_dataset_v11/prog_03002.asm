; DESCRIPTION: Renders a green line between points (31, 174) and (49, 19).
; PLAN: r0=31(x1), r1=174(y1), r2=49(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 174
LDI r2, 49
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
