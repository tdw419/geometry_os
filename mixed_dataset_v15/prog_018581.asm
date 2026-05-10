; DESCRIPTION: Draws a magenta line from (57, 21) to (199, 75).
; PLAN: r0=57(x1), r1=21(y1), r2=199(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 21
LDI r2, 199
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
