; DESCRIPTION: Places a green line segment connecting (166, 23) to (460, 252).
; PLAN: r0=166(x1), r1=23(y1), r2=460(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 23
LDI r2, 460
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
