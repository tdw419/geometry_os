; DESCRIPTION: Renders a red line between points (267, 22) and (181, 188).
; PLAN: r0=267(x1), r1=22(y1), r2=181(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 22
LDI r2, 181
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
