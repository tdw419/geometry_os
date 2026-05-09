; DESCRIPTION: Places a magenta line segment connecting (230, 178) to (178, 6).
; PLAN: r0=230(x1), r1=178(y1), r2=178(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 178
LDI r2, 178
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
