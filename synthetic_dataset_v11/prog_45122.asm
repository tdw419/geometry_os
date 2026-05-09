; DESCRIPTION: Draws a blue line from (27, 123) to (190, 196).
; PLAN: r0=27(x1), r1=123(y1), r2=190(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 123
LDI r2, 190
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
