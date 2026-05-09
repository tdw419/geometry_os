; DESCRIPTION: Draws a magenta line from (470, 54) to (121, 7).
; PLAN: r0=470(x1), r1=54(y1), r2=121(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 54
LDI r2, 121
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
