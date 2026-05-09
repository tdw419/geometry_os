; DESCRIPTION: Draws a magenta line from (84, 166) to (308, 132).
; PLAN: r0=84(x1), r1=166(y1), r2=308(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 166
LDI r2, 308
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
