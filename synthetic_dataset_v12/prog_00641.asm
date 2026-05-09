; DESCRIPTION: Places a green line segment connecting (327, 186) to (385, 191).
; PLAN: r0=327(x1), r1=186(y1), r2=385(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 186
LDI r2, 385
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
