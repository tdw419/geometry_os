; DESCRIPTION: Draws a red line from (43, 100) to (307, 205).
; PLAN: r0=43(x1), r1=100(y1), r2=307(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 100
LDI r2, 307
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
