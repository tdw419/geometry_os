; DESCRIPTION: Draws a magenta line from (74, 84) to (220, 22).
; PLAN: r0=74(x1), r1=84(y1), r2=220(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 84
LDI r2, 220
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
