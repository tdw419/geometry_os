; DESCRIPTION: Draws a magenta line from (29, 12) to (8, 60).
; PLAN: r0=29(x1), r1=12(y1), r2=8(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 12
LDI r2, 8
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
