; DESCRIPTION: Draws a magenta line from (354, 107) to (334, 189).
; PLAN: r0=354(x1), r1=107(y1), r2=334(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 107
LDI r2, 334
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
