; DESCRIPTION: Draws a magenta line from (216, 32) to (196, 35).
; PLAN: r0=216(x1), r1=32(y1), r2=196(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 32
LDI r2, 196
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
