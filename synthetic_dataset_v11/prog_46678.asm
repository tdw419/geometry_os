; DESCRIPTION: Places a black line segment connecting (134, 231) to (14, 186).
; PLAN: r0=134(x1), r1=231(y1), r2=14(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 231
LDI r2, 14
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
