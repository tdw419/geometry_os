; DESCRIPTION: Places a red line segment connecting (262, 127) to (172, 54).
; PLAN: r0=262(x1), r1=127(y1), r2=172(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 127
LDI r2, 172
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
