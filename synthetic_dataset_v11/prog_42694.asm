; DESCRIPTION: Places a yellow line segment connecting (24, 104) to (70, 57).
; PLAN: r0=24(x1), r1=104(y1), r2=70(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 104
LDI r2, 70
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
