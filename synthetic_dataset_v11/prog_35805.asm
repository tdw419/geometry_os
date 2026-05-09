; DESCRIPTION: Draws a orange line from (237, 35) to (174, 141).
; PLAN: r0=237(x1), r1=35(y1), r2=174(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 35
LDI r2, 174
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
