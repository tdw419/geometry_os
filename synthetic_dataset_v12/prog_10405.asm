; DESCRIPTION: Places a yellow line segment connecting (382, 175) to (213, 65).
; PLAN: r0=382(x1), r1=175(y1), r2=213(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 175
LDI r2, 213
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
