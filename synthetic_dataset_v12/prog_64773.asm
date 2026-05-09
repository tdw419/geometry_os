; DESCRIPTION: Draws a green line from (267, 25) to (402, 189).
; PLAN: r0=267(x1), r1=25(y1), r2=402(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 25
LDI r2, 402
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
