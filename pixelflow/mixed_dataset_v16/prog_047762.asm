; DESCRIPTION: Draws a red line from (402, 1) to (33, 159).
; PLAN: r0=402(x1), r1=1(y1), r2=33(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 1
LDI r2, 33
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
