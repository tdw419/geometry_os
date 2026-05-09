; DESCRIPTION: Draws a red line from (87, 100) to (402, 84).
; PLAN: r0=87(x1), r1=100(y1), r2=402(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 100
LDI r2, 402
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
