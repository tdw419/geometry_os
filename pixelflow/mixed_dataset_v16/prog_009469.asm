; DESCRIPTION: Places a black line segment connecting (385, 58) to (445, 188).
; PLAN: r0=385(x1), r1=58(y1), r2=445(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 58
LDI r2, 445
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
