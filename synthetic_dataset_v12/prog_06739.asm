; DESCRIPTION: Renders a green line between points (267, 232) and (137, 70).
; PLAN: r0=267(x1), r1=232(y1), r2=137(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 232
LDI r2, 137
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
