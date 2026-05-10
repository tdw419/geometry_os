; DESCRIPTION: Renders a magenta line segment connecting (262, 174) to (282, 53).
; PLAN: r0=262(x1), r1=174(y1), r2=282(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 174
LDI r2, 282
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
