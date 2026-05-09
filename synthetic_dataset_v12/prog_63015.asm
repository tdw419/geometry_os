; DESCRIPTION: Places a green line segment connecting (468, 104) to (356, 236).
; PLAN: r0=468(x1), r1=104(y1), r2=356(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 104
LDI r2, 356
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
