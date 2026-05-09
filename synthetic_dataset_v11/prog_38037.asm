; DESCRIPTION: Draws a magenta line from (145, 152) to (107, 31).
; PLAN: r0=145(x1), r1=152(y1), r2=107(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 152
LDI r2, 107
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
