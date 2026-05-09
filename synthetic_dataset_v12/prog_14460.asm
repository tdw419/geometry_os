; DESCRIPTION: Places a green line segment connecting (387, 206) to (315, 26).
; PLAN: r0=387(x1), r1=206(y1), r2=315(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 206
LDI r2, 315
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
