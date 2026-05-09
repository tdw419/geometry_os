; DESCRIPTION: Places a green line segment connecting (122, 48) to (248, 127).
; PLAN: r0=122(x1), r1=48(y1), r2=248(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 48
LDI r2, 248
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
