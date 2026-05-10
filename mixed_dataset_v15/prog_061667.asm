; DESCRIPTION: Renders a red line between points (353, 127) and (11, 133).
; PLAN: r0=353(x1), r1=127(y1), r2=11(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 127
LDI r2, 11
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
