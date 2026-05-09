; DESCRIPTION: Draws a magenta line from (288, 191) to (328, 194).
; PLAN: r0=288(x1), r1=191(y1), r2=328(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 191
LDI r2, 328
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
