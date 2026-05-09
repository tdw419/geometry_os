; DESCRIPTION: Draws a magenta line from (118, 5) to (136, 192).
; PLAN: r0=118(x1), r1=5(y1), r2=136(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 5
LDI r2, 136
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
