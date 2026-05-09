; DESCRIPTION: Places a yellow line segment connecting (215, 175) to (45, 152).
; PLAN: r0=215(x1), r1=175(y1), r2=45(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 175
LDI r2, 45
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
