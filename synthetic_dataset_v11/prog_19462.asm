; DESCRIPTION: Renders a red line between points (216, 207) and (182, 13).
; PLAN: r0=216(x1), r1=207(y1), r2=182(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 207
LDI r2, 182
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
