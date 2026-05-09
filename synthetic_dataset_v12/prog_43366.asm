; DESCRIPTION: Places a green line segment connecting (325, 199) to (406, 164).
; PLAN: r0=325(x1), r1=199(y1), r2=406(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 199
LDI r2, 406
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
