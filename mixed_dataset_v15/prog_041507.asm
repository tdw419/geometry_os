; DESCRIPTION: Renders a purple line between points (344, 162) and (267, 189).
; PLAN: r0=344(x1), r1=162(y1), r2=267(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 162
LDI r2, 267
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
