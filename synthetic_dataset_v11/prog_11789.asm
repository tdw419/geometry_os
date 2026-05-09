; DESCRIPTION: Draws a orange line from (13, 239) to (64, 112).
; PLAN: r0=13(x1), r1=239(y1), r2=64(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 239
LDI r2, 64
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
