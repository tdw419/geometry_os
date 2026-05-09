; DESCRIPTION: Renders a magenta line between points (267, 5) and (103, 0).
; PLAN: r0=267(x1), r1=5(y1), r2=103(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 5
LDI r2, 103
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
