; DESCRIPTION: Draws a magenta line from (260, 13) to (425, 136).
; PLAN: r0=260(x1), r1=13(y1), r2=425(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 13
LDI r2, 425
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
