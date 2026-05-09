; DESCRIPTION: Renders a magenta line between points (25, 106) and (210, 103).
; PLAN: r0=25(x1), r1=106(y1), r2=210(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 106
LDI r2, 210
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
