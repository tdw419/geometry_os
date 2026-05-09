; DESCRIPTION: Draws a magenta line from (193, 172) to (168, 136).
; PLAN: r0=193(x1), r1=172(y1), r2=168(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 172
LDI r2, 168
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
