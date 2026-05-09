; DESCRIPTION: Draws a green line from (267, 99) to (132, 115).
; PLAN: r0=267(x1), r1=99(y1), r2=132(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 99
LDI r2, 132
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
