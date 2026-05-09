; DESCRIPTION: Draws a green line from (145, 114) to (278, 79).
; PLAN: r0=145(x1), r1=114(y1), r2=278(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 114
LDI r2, 278
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
