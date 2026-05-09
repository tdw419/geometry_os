; DESCRIPTION: Draws a magenta line from (39, 155) to (329, 170).
; PLAN: r0=39(x1), r1=155(y1), r2=329(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 155
LDI r2, 329
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
