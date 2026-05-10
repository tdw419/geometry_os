; DESCRIPTION: Draws a magenta line from (102, 107) to (136, 40).
; PLAN: r0=102(x1), r1=107(y1), r2=136(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 107
LDI r2, 136
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
