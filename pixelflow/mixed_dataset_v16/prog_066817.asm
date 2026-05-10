; DESCRIPTION: Draws a orange line from (450, 84) to (368, 207).
; PLAN: r0=450(x1), r1=84(y1), r2=368(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 84
LDI r2, 368
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
