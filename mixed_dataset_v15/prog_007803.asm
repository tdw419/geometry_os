; DESCRIPTION: Draws a magenta line from (418, 107) to (1, 8).
; PLAN: r0=418(x1), r1=107(y1), r2=1(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 107
LDI r2, 1
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
