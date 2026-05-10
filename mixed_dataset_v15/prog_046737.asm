; DESCRIPTION: Draws a orange line from (511, 40) to (255, 229).
; PLAN: r0=511(x1), r1=40(y1), r2=255(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 40
LDI r2, 255
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
