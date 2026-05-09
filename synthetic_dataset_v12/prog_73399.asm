; DESCRIPTION: Places a green line segment connecting (466, 244) to (202, 137).
; PLAN: r0=466(x1), r1=244(y1), r2=202(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 244
LDI r2, 202
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
