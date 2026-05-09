; DESCRIPTION: Renders a red line between points (202, 220) and (149, 105).
; PLAN: r0=202(x1), r1=220(y1), r2=149(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 220
LDI r2, 149
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
