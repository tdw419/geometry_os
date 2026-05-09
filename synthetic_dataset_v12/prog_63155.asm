; DESCRIPTION: Renders a red line between points (389, 233) and (127, 91).
; PLAN: r0=389(x1), r1=233(y1), r2=127(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 233
LDI r2, 127
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
