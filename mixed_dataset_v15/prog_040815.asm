; DESCRIPTION: Places a yellow line segment connecting (466, 59) to (382, 58).
; PLAN: r0=466(x1), r1=59(y1), r2=382(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 59
LDI r2, 382
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
