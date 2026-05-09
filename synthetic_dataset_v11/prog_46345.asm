; DESCRIPTION: Renders a magenta line between points (132, 99) and (171, 60).
; PLAN: r0=132(x1), r1=99(y1), r2=171(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 99
LDI r2, 171
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
