; DESCRIPTION: Renders a magenta line segment connecting (152, 94) to (365, 184).
; PLAN: r0=152(x1), r1=94(y1), r2=365(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 94
LDI r2, 365
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
