; DESCRIPTION: Draws a magenta line from (179, 191) to (193, 191).
; PLAN: r0=179(x1), r1=191(y1), r2=193(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 191
LDI r2, 193
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
