; DESCRIPTION: Places a black line segment connecting (157, 150) to (408, 37).
; PLAN: r0=157(x1), r1=150(y1), r2=408(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 150
LDI r2, 408
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
