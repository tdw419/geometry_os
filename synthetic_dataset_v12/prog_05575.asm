; DESCRIPTION: Renders a red line between points (133, 114) and (296, 126).
; PLAN: r0=133(x1), r1=114(y1), r2=296(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 114
LDI r2, 296
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
