; DESCRIPTION: Places a magenta line segment connecting (136, 125) to (504, 186).
; PLAN: r0=136(x1), r1=125(y1), r2=504(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 125
LDI r2, 504
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
