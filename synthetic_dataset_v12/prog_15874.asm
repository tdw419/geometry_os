; DESCRIPTION: Places a black line segment connecting (271, 58) to (435, 220).
; PLAN: r0=271(x1), r1=58(y1), r2=435(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 58
LDI r2, 435
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
