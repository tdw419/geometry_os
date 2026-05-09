; DESCRIPTION: Draws a green line from (106, 188) to (6, 69).
; PLAN: r0=106(x1), r1=188(y1), r2=6(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 188
LDI r2, 6
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
