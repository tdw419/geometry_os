; DESCRIPTION: Places a green line segment connecting (198, 8) to (338, 193).
; PLAN: r0=198(x1), r1=8(y1), r2=338(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 8
LDI r2, 338
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
