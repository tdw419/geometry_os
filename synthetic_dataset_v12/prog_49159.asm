; DESCRIPTION: Renders a red line between points (267, 103) and (279, 63).
; PLAN: r0=267(x1), r1=103(y1), r2=279(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 103
LDI r2, 279
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
