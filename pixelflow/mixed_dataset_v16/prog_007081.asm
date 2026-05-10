; DESCRIPTION: Places a yellow line segment connecting (435, 178) to (72, 153).
; PLAN: r0=435(x1), r1=178(y1), r2=72(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 178
LDI r2, 72
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
