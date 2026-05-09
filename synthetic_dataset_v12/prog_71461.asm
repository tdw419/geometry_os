; DESCRIPTION: Renders a red line between points (376, 166) and (368, 74).
; PLAN: r0=376(x1), r1=166(y1), r2=368(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 166
LDI r2, 368
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
