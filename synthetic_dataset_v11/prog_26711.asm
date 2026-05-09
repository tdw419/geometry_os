; DESCRIPTION: Places a green line segment connecting (103, 8) to (86, 92).
; PLAN: r0=103(x1), r1=8(y1), r2=86(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 8
LDI r2, 86
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
