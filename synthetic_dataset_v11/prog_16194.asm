; DESCRIPTION: Renders a red line between points (221, 114) and (150, 53).
; PLAN: r0=221(x1), r1=114(y1), r2=150(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 114
LDI r2, 150
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
