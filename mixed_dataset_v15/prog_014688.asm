; DESCRIPTION: Places a yellow line segment connecting (420, 69) to (424, 37).
; PLAN: r0=420(x1), r1=69(y1), r2=424(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 69
LDI r2, 424
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
