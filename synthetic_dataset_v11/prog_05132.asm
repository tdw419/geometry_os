; DESCRIPTION: Draws a magenta line from (6, 29) to (98, 46).
; PLAN: r0=6(x1), r1=29(y1), r2=98(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 29
LDI r2, 98
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
