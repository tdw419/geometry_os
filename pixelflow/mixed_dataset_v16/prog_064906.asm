; DESCRIPTION: Renders a red line between points (423, 220) and (90, 234).
; PLAN: r0=423(x1), r1=220(y1), r2=90(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 220
LDI r2, 90
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
