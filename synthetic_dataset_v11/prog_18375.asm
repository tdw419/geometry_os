; DESCRIPTION: Places a yellow line segment connecting (237, 217) to (175, 187).
; PLAN: r0=237(x1), r1=217(y1), r2=175(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 217
LDI r2, 175
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
