; DESCRIPTION: Places a green line segment connecting (21, 0) to (178, 160).
; PLAN: r0=21(x1), r1=0(y1), r2=178(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 0
LDI r2, 178
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
