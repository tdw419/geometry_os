; DESCRIPTION: Places a purple line segment connecting (215, 152) to (175, 69).
; PLAN: r0=215(x1), r1=152(y1), r2=175(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 152
LDI r2, 175
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
