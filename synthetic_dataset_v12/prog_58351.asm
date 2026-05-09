; DESCRIPTION: Draws a blue line from (280, 132) to (74, 162).
; PLAN: r0=280(x1), r1=132(y1), r2=74(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 132
LDI r2, 74
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
