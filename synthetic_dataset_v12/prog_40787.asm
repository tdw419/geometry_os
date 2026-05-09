; DESCRIPTION: Draws a orange line from (87, 9) to (332, 50).
; PLAN: r0=87(x1), r1=9(y1), r2=332(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 9
LDI r2, 332
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
