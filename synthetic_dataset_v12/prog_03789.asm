; DESCRIPTION: Places a green line segment connecting (164, 160) to (383, 153).
; PLAN: r0=164(x1), r1=160(y1), r2=383(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 160
LDI r2, 383
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
