; DESCRIPTION: Draws a magenta line from (209, 50) to (191, 169).
; PLAN: r0=209(x1), r1=50(y1), r2=191(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 50
LDI r2, 191
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
