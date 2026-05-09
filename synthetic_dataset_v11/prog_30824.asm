; DESCRIPTION: Draws a red line from (191, 68) to (95, 53).
; PLAN: r0=191(x1), r1=68(y1), r2=95(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 68
LDI r2, 95
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
