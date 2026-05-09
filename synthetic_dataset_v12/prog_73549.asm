; DESCRIPTION: Places a magenta line segment connecting (504, 165) to (308, 208).
; PLAN: r0=504(x1), r1=165(y1), r2=308(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 165
LDI r2, 308
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
