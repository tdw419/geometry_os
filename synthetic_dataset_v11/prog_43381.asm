; DESCRIPTION: Places a purple line segment connecting (175, 27) to (32, 65).
; PLAN: r0=175(x1), r1=27(y1), r2=32(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 27
LDI r2, 32
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
