; DESCRIPTION: Places a yellow line segment connecting (213, 4) to (86, 73).
; PLAN: r0=213(x1), r1=4(y1), r2=86(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 4
LDI r2, 86
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
