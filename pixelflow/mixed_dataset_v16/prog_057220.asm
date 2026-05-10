; DESCRIPTION: Draws a magenta line from (91, 119) to (74, 46).
; PLAN: r0=91(x1), r1=119(y1), r2=74(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 119
LDI r2, 74
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
