; DESCRIPTION: Draws a orange line from (126, 162) to (133, 93).
; PLAN: r0=126(x1), r1=162(y1), r2=133(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 162
LDI r2, 133
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
