; DESCRIPTION: Draws a yellow line from (83, 126) to (453, 132).
; PLAN: r0=83(x1), r1=126(y1), r2=453(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 126
LDI r2, 453
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
