; DESCRIPTION: Renders a magenta line between points (61, 20) and (119, 171).
; PLAN: r0=61(x1), r1=20(y1), r2=119(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 20
LDI r2, 119
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
