; DESCRIPTION: Renders a red line between points (154, 141) and (233, 68).
; PLAN: r0=154(x1), r1=141(y1), r2=233(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 141
LDI r2, 233
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
