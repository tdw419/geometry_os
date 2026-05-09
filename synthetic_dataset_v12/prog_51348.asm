; DESCRIPTION: Draws a orange line from (283, 2) to (494, 220).
; PLAN: r0=283(x1), r1=2(y1), r2=494(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 2
LDI r2, 494
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
