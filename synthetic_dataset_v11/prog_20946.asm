; DESCRIPTION: Draws a magenta line from (49, 202) to (206, 87).
; PLAN: r0=49(x1), r1=202(y1), r2=206(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 202
LDI r2, 206
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
