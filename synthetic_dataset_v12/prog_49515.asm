; DESCRIPTION: Draws a magenta line from (79, 21) to (361, 200).
; PLAN: r0=79(x1), r1=21(y1), r2=361(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 21
LDI r2, 361
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
