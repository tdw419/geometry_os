; DESCRIPTION: Draws a magenta line from (405, 237) to (169, 6).
; PLAN: r0=405(x1), r1=237(y1), r2=169(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 237
LDI r2, 169
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
