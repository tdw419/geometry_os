; DESCRIPTION: Draws a yellow line from (331, 178) to (146, 252).
; PLAN: r0=331(x1), r1=178(y1), r2=146(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 178
LDI r2, 146
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
