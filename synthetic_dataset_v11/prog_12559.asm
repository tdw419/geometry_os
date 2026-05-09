; DESCRIPTION: Places a green line segment connecting (18, 37) to (68, 2).
; PLAN: r0=18(x1), r1=37(y1), r2=68(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 37
LDI r2, 68
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
