; DESCRIPTION: Renders a red line between points (16, 178) and (273, 47).
; PLAN: r0=16(x1), r1=178(y1), r2=273(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 178
LDI r2, 273
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
