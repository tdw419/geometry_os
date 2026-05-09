; DESCRIPTION: Draws a magenta line from (237, 214) to (217, 118).
; PLAN: r0=237(x1), r1=214(y1), r2=217(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 214
LDI r2, 217
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
