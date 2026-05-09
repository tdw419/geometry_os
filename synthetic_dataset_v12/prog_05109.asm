; DESCRIPTION: Draws a magenta line from (90, 68) to (334, 29).
; PLAN: r0=90(x1), r1=68(y1), r2=334(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 68
LDI r2, 334
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
