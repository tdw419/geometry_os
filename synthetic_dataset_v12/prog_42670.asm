; DESCRIPTION: Draws a magenta line from (93, 188) to (202, 9).
; PLAN: r0=93(x1), r1=188(y1), r2=202(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 188
LDI r2, 202
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
