; DESCRIPTION: Draws a magenta line from (160, 107) to (9, 28).
; PLAN: r0=160(x1), r1=107(y1), r2=9(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 107
LDI r2, 9
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
