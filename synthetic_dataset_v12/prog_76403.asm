; DESCRIPTION: Places a magenta line segment connecting (25, 57) to (293, 233).
; PLAN: r0=25(x1), r1=57(y1), r2=293(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 57
LDI r2, 293
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
