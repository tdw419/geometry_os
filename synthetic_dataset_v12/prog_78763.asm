; DESCRIPTION: Draws a yellow line from (448, 126) to (88, 48).
; PLAN: r0=448(x1), r1=126(y1), r2=88(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 126
LDI r2, 88
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
