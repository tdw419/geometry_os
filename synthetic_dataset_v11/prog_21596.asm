; DESCRIPTION: Draws a magenta line from (113, 21) to (79, 170).
; PLAN: r0=113(x1), r1=21(y1), r2=79(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 21
LDI r2, 79
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
