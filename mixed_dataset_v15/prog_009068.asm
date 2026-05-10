; DESCRIPTION: Draws a yellow line from (407, 129) to (3, 205).
; PLAN: r0=407(x1), r1=129(y1), r2=3(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 129
LDI r2, 3
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
