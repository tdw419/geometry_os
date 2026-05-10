; DESCRIPTION: Draws a orange line from (161, 114) to (180, 36).
; PLAN: r0=161(x1), r1=114(y1), r2=180(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 114
LDI r2, 180
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
