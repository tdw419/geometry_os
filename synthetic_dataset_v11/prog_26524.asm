; DESCRIPTION: Places a magenta line segment connecting (165, 66) to (220, 48).
; PLAN: r0=165(x1), r1=66(y1), r2=220(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 66
LDI r2, 220
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
