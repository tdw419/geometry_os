; DESCRIPTION: Places a white line segment connecting (120, 37) to (29, 229).
; PLAN: r0=120(x1), r1=37(y1), r2=29(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 37
LDI r2, 29
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
