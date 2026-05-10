; DESCRIPTION: Places a green line segment connecting (333, 148) to (319, 237).
; PLAN: r0=333(x1), r1=148(y1), r2=319(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 148
LDI r2, 319
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
