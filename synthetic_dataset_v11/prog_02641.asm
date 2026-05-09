; DESCRIPTION: Renders a red line between points (153, 127) and (23, 181).
; PLAN: r0=153(x1), r1=127(y1), r2=23(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 127
LDI r2, 23
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
