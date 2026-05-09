; DESCRIPTION: Places a magenta line segment connecting (75, 120) to (102, 172).
; PLAN: r0=75(x1), r1=120(y1), r2=102(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 120
LDI r2, 102
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
