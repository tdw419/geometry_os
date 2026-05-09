; DESCRIPTION: Draws a red line from (21, 3) to (113, 85).
; PLAN: r0=21(x1), r1=3(y1), r2=113(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 3
LDI r2, 113
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
