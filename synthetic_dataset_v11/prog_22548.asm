; DESCRIPTION: Draws a magenta line from (36, 152) to (114, 200).
; PLAN: r0=36(x1), r1=152(y1), r2=114(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 152
LDI r2, 114
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
