; DESCRIPTION: Renders a green line between points (292, 182) and (185, 9).
; PLAN: r0=292(x1), r1=182(y1), r2=185(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 182
LDI r2, 185
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
