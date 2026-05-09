; DESCRIPTION: Draws a magenta line from (108, 225) to (213, 105).
; PLAN: r0=108(x1), r1=225(y1), r2=213(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 225
LDI r2, 213
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
