; DESCRIPTION: Draws a orange line from (362, 189) to (469, 218).
; PLAN: r0=362(x1), r1=189(y1), r2=469(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 189
LDI r2, 469
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
