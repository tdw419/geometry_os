; DESCRIPTION: Places a magenta line segment connecting (69, 22) to (475, 178).
; PLAN: r0=69(x1), r1=22(y1), r2=475(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 22
LDI r2, 475
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
