; DESCRIPTION: Places a green line segment connecting (104, 44) to (11, 143).
; PLAN: r0=104(x1), r1=44(y1), r2=11(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 44
LDI r2, 11
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
