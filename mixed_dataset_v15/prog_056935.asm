; DESCRIPTION: Renders a magenta line between points (307, 179) and (59, 97).
; PLAN: r0=307(x1), r1=179(y1), r2=59(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 179
LDI r2, 59
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
