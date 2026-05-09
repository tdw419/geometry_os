; DESCRIPTION: Draws a red line from (106, 93) to (114, 99).
; PLAN: r0=106(x1), r1=93(y1), r2=114(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 93
LDI r2, 114
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
