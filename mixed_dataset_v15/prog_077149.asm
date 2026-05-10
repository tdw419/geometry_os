; DESCRIPTION: Places a yellow line segment connecting (493, 21) to (127, 49).
; PLAN: r0=493(x1), r1=21(y1), r2=127(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 21
LDI r2, 127
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
