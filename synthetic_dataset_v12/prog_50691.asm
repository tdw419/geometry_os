; DESCRIPTION: Places a magenta line segment connecting (341, 99) to (120, 166).
; PLAN: r0=341(x1), r1=99(y1), r2=120(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 99
LDI r2, 120
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
