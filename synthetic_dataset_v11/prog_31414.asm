; DESCRIPTION: Places a yellow line segment connecting (32, 187) to (14, 152).
; PLAN: r0=32(x1), r1=187(y1), r2=14(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 187
LDI r2, 14
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
