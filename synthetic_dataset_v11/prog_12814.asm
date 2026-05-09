; DESCRIPTION: Places a black line segment connecting (72, 206) to (99, 103).
; PLAN: r0=72(x1), r1=206(y1), r2=99(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 206
LDI r2, 99
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
