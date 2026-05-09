; DESCRIPTION: Draws a magenta line from (209, 93) to (500, 1).
; PLAN: r0=209(x1), r1=93(y1), r2=500(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 93
LDI r2, 500
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
