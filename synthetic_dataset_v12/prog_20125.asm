; DESCRIPTION: Places a green line segment connecting (334, 15) to (362, 56).
; PLAN: r0=334(x1), r1=15(y1), r2=362(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 15
LDI r2, 362
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
