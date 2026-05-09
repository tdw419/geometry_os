; DESCRIPTION: Draws a orange line from (237, 171) to (462, 94).
; PLAN: r0=237(x1), r1=171(y1), r2=462(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 171
LDI r2, 462
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
