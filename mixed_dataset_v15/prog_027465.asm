; DESCRIPTION: Draws a black line from (457, 9) to (423, 182).
; PLAN: r0=457(x1), r1=9(y1), r2=423(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 9
LDI r2, 423
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
