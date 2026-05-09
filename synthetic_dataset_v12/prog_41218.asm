; DESCRIPTION: Draws a white line from (132, 198) to (430, 196).
; PLAN: r0=132(x1), r1=198(y1), r2=430(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 198
LDI r2, 430
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
