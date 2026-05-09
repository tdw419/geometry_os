; DESCRIPTION: Places a green line segment connecting (50, 104) to (72, 66).
; PLAN: r0=50(x1), r1=104(y1), r2=72(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 104
LDI r2, 72
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
