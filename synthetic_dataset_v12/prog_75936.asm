; DESCRIPTION: Draws a orange line from (181, 120) to (374, 214).
; PLAN: r0=181(x1), r1=120(y1), r2=374(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 120
LDI r2, 374
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
