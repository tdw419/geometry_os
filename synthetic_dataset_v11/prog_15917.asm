; DESCRIPTION: Places a white line segment connecting (29, 34) to (245, 206).
; PLAN: r0=29(x1), r1=34(y1), r2=245(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 34
LDI r2, 245
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
