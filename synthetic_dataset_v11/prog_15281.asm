; DESCRIPTION: Draws a yellow line from (106, 122) to (68, 196).
; PLAN: r0=106(x1), r1=122(y1), r2=68(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 122
LDI r2, 68
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
