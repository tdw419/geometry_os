; DESCRIPTION: Draws a blue line from (290, 192) to (35, 196).
; PLAN: r0=290(x1), r1=192(y1), r2=35(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 192
LDI r2, 35
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
