; DESCRIPTION: Renders a red line between points (132, 117) and (25, 39).
; PLAN: r0=132(x1), r1=117(y1), r2=25(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 117
LDI r2, 25
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
