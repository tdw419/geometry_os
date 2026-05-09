; DESCRIPTION: Places a green line segment connecting (198, 231) to (52, 25).
; PLAN: r0=198(x1), r1=231(y1), r2=52(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 231
LDI r2, 52
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
