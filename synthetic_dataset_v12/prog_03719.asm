; DESCRIPTION: Places a orange line segment connecting (379, 206) to (29, 28).
; PLAN: r0=379(x1), r1=206(y1), r2=29(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 206
LDI r2, 29
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
