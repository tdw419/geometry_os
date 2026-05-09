; DESCRIPTION: Draws a orange line from (277, 43) to (385, 95).
; PLAN: r0=277(x1), r1=43(y1), r2=385(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 43
LDI r2, 385
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
