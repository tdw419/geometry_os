; DESCRIPTION: Places a black line segment connecting (5, 206) to (308, 66).
; PLAN: r0=5(x1), r1=206(y1), r2=308(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 206
LDI r2, 308
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
