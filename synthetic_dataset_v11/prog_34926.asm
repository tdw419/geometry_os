; DESCRIPTION: Draws a magenta line from (94, 214) to (105, 174).
; PLAN: r0=94(x1), r1=214(y1), r2=105(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 214
LDI r2, 105
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
