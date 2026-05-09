; DESCRIPTION: Places a green line segment connecting (364, 225) to (460, 45).
; PLAN: r0=364(x1), r1=225(y1), r2=460(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 225
LDI r2, 460
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
