; DESCRIPTION: Renders a magenta line between points (162, 235) and (59, 148).
; PLAN: r0=162(x1), r1=235(y1), r2=59(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 235
LDI r2, 59
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
