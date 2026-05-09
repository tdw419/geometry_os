; DESCRIPTION: Renders a magenta line between points (450, 103) and (33, 168).
; PLAN: r0=450(x1), r1=103(y1), r2=33(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 103
LDI r2, 33
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
