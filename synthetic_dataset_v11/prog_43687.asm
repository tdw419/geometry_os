; DESCRIPTION: Places a magenta line segment connecting (171, 166) to (112, 255).
; PLAN: r0=171(x1), r1=166(y1), r2=112(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 166
LDI r2, 112
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
