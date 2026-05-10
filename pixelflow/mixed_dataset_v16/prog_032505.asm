; DESCRIPTION: Places a magenta line segment connecting (28, 237) to (261, 69).
; PLAN: r0=28(x1), r1=237(y1), r2=261(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 237
LDI r2, 261
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
