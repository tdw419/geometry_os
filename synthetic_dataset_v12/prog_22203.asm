; DESCRIPTION: Draws a yellow line from (36, 54) to (428, 2).
; PLAN: r0=36(x1), r1=54(y1), r2=428(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 54
LDI r2, 428
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
