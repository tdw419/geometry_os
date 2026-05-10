; DESCRIPTION: Draws a yellow line from (29, 56) to (70, 205).
; PLAN: r0=29(x1), r1=56(y1), r2=70(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 56
LDI r2, 70
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
