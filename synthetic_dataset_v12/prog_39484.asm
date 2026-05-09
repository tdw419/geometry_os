; DESCRIPTION: Draws a red line from (402, 123) to (330, 100).
; PLAN: r0=402(x1), r1=123(y1), r2=330(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 123
LDI r2, 330
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
