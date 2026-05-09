; DESCRIPTION: Places a black line segment connecting (387, 58) to (268, 40).
; PLAN: r0=387(x1), r1=58(y1), r2=268(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 58
LDI r2, 268
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
