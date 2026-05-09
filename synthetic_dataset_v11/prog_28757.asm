; DESCRIPTION: Draws a orange line from (153, 210) to (75, 214).
; PLAN: r0=153(x1), r1=210(y1), r2=75(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 210
LDI r2, 75
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
