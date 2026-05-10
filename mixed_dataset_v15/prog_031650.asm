; DESCRIPTION: Places a green line segment connecting (387, 186) to (30, 35).
; PLAN: r0=387(x1), r1=186(y1), r2=30(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 186
LDI r2, 30
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
