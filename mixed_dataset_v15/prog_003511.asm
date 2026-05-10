; DESCRIPTION: Renders a red line between points (456, 127) and (290, 141).
; PLAN: r0=456(x1), r1=127(y1), r2=290(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 127
LDI r2, 290
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
