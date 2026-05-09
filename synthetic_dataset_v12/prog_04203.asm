; DESCRIPTION: Places a green line segment connecting (425, 187) to (385, 151).
; PLAN: r0=425(x1), r1=187(y1), r2=385(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 187
LDI r2, 385
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
