; DESCRIPTION: Draws a yellow line from (36, 50) to (196, 252).
; PLAN: r0=36(x1), r1=50(y1), r2=196(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 50
LDI r2, 196
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
