; DESCRIPTION: Places a white line segment connecting (22, 230) to (249, 65).
; PLAN: r0=22(x1), r1=230(y1), r2=249(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 230
LDI r2, 249
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
