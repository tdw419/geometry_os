; DESCRIPTION: Draws a magenta line from (177, 61) to (331, 167).
; PLAN: r0=177(x1), r1=61(y1), r2=331(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 61
LDI r2, 331
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
