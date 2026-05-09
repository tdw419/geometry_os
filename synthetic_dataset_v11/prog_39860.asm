; DESCRIPTION: Places a white line segment connecting (238, 208) to (185, 127).
; PLAN: r0=238(x1), r1=208(y1), r2=185(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 208
LDI r2, 185
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
