; DESCRIPTION: Draws a magenta line from (196, 49) to (35, 174).
; PLAN: r0=196(x1), r1=49(y1), r2=35(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 49
LDI r2, 35
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
