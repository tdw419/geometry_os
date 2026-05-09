; DESCRIPTION: Places a magenta line segment connecting (210, 57) to (125, 11).
; PLAN: r0=210(x1), r1=57(y1), r2=125(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 57
LDI r2, 125
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
