; DESCRIPTION: Draws a magenta line from (447, 28) to (77, 76).
; PLAN: r0=447(x1), r1=28(y1), r2=77(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 28
LDI r2, 77
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
