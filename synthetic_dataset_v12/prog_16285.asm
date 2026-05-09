; DESCRIPTION: Renders a magenta line between points (223, 103) and (133, 113).
; PLAN: r0=223(x1), r1=103(y1), r2=133(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 103
LDI r2, 133
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
