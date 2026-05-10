; DESCRIPTION: Renders a red line between points (197, 231) and (427, 138).
; PLAN: r0=197(x1), r1=231(y1), r2=427(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 231
LDI r2, 427
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
