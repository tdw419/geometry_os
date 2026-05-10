; DESCRIPTION: Draws a magenta line from (188, 132) to (42, 167).
; PLAN: r0=188(x1), r1=132(y1), r2=42(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 132
LDI r2, 42
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
