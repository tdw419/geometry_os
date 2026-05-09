; DESCRIPTION: Draws a green line from (245, 11) to (432, 112).
; PLAN: r0=245(x1), r1=11(y1), r2=432(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 11
LDI r2, 432
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
