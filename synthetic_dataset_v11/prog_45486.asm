; DESCRIPTION: Draws a magenta line from (94, 157) to (48, 140).
; PLAN: r0=94(x1), r1=157(y1), r2=48(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 157
LDI r2, 48
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
