; DESCRIPTION: Draws a orange line from (311, 5) to (20, 243).
; PLAN: r0=311(x1), r1=5(y1), r2=20(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 5
LDI r2, 20
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
