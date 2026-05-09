; DESCRIPTION: Places a magenta line segment connecting (143, 148) to (176, 29).
; PLAN: r0=143(x1), r1=148(y1), r2=176(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 148
LDI r2, 176
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
