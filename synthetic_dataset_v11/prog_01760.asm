; DESCRIPTION: Places a yellow line segment connecting (187, 166) to (86, 72).
; PLAN: r0=187(x1), r1=166(y1), r2=86(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 166
LDI r2, 86
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
