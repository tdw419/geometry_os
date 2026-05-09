; DESCRIPTION: Draws a orange line from (208, 239) to (85, 23).
; PLAN: r0=208(x1), r1=239(y1), r2=85(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 239
LDI r2, 85
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
