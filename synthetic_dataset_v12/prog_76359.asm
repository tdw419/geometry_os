; DESCRIPTION: Places a magenta line segment connecting (495, 217) to (488, 230).
; PLAN: r0=495(x1), r1=217(y1), r2=488(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 217
LDI r2, 488
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
