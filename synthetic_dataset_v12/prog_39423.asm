; DESCRIPTION: Draws a yellow line from (432, 109) to (281, 191).
; PLAN: r0=432(x1), r1=109(y1), r2=281(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 109
LDI r2, 281
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
