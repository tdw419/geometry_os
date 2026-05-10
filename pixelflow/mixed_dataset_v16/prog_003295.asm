; DESCRIPTION: Draws a magenta line from (83, 114) to (466, 3).
; PLAN: r0=83(x1), r1=114(y1), r2=466(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 114
LDI r2, 466
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
