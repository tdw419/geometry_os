; DESCRIPTION: Places a black line segment connecting (387, 143) to (311, 31).
; PLAN: r0=387(x1), r1=143(y1), r2=311(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 143
LDI r2, 311
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
