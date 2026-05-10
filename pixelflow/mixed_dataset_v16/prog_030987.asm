; DESCRIPTION: Places a black line segment connecting (308, 154) to (454, 68).
; PLAN: r0=308(x1), r1=154(y1), r2=454(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 154
LDI r2, 454
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
