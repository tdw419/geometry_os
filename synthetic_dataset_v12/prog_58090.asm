; DESCRIPTION: Renders a yellow line between points (411, 75) and (267, 173).
; PLAN: r0=411(x1), r1=75(y1), r2=267(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 75
LDI r2, 267
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
