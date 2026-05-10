; DESCRIPTION: Draws a orange line from (272, 180) to (98, 6).
; PLAN: r0=272(x1), r1=180(y1), r2=98(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 180
LDI r2, 98
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
