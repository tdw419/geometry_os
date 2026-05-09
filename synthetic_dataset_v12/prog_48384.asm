; DESCRIPTION: Places a orange line segment connecting (277, 121) to (195, 241).
; PLAN: r0=277(x1), r1=121(y1), r2=195(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 121
LDI r2, 195
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
