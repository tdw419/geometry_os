; DESCRIPTION: Renders a red line between points (127, 246) and (123, 12).
; PLAN: r0=127(x1), r1=246(y1), r2=123(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 246
LDI r2, 123
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
