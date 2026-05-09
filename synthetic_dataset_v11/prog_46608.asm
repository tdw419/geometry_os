; DESCRIPTION: Draws a orange line from (146, 223) to (25, 179).
; PLAN: r0=146(x1), r1=223(y1), r2=25(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 223
LDI r2, 25
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
