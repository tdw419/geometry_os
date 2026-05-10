; DESCRIPTION: Places a magenta line segment connecting (91, 120) to (316, 83).
; PLAN: r0=91(x1), r1=120(y1), r2=316(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 120
LDI r2, 316
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
