; DESCRIPTION: Places a magenta line segment connecting (84, 150) to (277, 166).
; PLAN: r0=84(x1), r1=150(y1), r2=277(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 150
LDI r2, 277
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
