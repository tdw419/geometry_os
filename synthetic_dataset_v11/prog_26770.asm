; DESCRIPTION: Places a black line segment connecting (59, 80) to (61, 207).
; PLAN: r0=59(x1), r1=80(y1), r2=61(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 80
LDI r2, 61
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
