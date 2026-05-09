; DESCRIPTION: Renders a blue line between points (156, 103) and (99, 171).
; PLAN: r0=156(x1), r1=103(y1), r2=99(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 103
LDI r2, 99
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
