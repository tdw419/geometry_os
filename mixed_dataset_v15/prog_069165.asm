; DESCRIPTION: Draws a blue line from (74, 126) to (56, 9).
; PLAN: r0=74(x1), r1=126(y1), r2=56(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 126
LDI r2, 56
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
