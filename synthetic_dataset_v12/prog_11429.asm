; DESCRIPTION: Renders a red line between points (466, 66) and (309, 198).
; PLAN: r0=466(x1), r1=66(y1), r2=309(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 66
LDI r2, 309
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
