; DESCRIPTION: Draws a green line from (104, 223) to (85, 110).
; PLAN: r0=104(x1), r1=223(y1), r2=85(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 223
LDI r2, 85
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
