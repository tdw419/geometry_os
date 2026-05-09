; DESCRIPTION: Draws a yellow line from (220, 252) to (60, 7).
; PLAN: r0=220(x1), r1=252(y1), r2=60(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 252
LDI r2, 60
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
