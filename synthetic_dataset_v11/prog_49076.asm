; DESCRIPTION: Places a magenta line segment connecting (87, 81) to (207, 33).
; PLAN: r0=87(x1), r1=81(y1), r2=207(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 81
LDI r2, 207
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
