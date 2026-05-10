; DESCRIPTION: Draws a magenta line from (167, 191) to (236, 21).
; PLAN: r0=167(x1), r1=191(y1), r2=236(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 191
LDI r2, 236
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
