; DESCRIPTION: Renders a magenta line between points (465, 79) and (361, 108).
; PLAN: r0=465(x1), r1=79(y1), r2=361(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 79
LDI r2, 361
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
