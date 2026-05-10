; DESCRIPTION: Draws a green line from (273, 69) to (100, 15).
; PLAN: r0=273(x1), r1=69(y1), r2=100(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 69
LDI r2, 100
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
