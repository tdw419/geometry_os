; DESCRIPTION: Renders a magenta line segment connecting (305, 16) to (235, 29).
; PLAN: r0=305(x1), r1=16(y1), r2=235(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 16
LDI r2, 235
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
