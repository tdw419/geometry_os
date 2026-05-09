; DESCRIPTION: Places a yellow line segment connecting (92, 2) to (113, 231).
; PLAN: r0=92(x1), r1=2(y1), r2=113(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 2
LDI r2, 113
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
