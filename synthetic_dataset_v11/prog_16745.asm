; DESCRIPTION: Draws a orange line from (102, 180) to (82, 85).
; PLAN: r0=102(x1), r1=180(y1), r2=82(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 180
LDI r2, 82
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
