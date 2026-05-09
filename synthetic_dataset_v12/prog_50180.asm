; DESCRIPTION: Draws a magenta line from (354, 44) to (453, 251).
; PLAN: r0=354(x1), r1=44(y1), r2=453(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 44
LDI r2, 453
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
