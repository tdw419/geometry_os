; DESCRIPTION: Draws a orange line from (393, 91) to (237, 241).
; PLAN: r0=393(x1), r1=91(y1), r2=237(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 91
LDI r2, 237
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
