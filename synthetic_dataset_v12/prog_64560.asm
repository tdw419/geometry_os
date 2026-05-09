; DESCRIPTION: Draws a magenta line from (70, 142) to (144, 214).
; PLAN: r0=70(x1), r1=142(y1), r2=144(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 142
LDI r2, 144
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
