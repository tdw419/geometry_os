; DESCRIPTION: Places a magenta line segment connecting (27, 145) to (120, 28).
; PLAN: r0=27(x1), r1=145(y1), r2=120(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 145
LDI r2, 120
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
