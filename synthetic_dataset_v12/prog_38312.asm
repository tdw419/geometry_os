; DESCRIPTION: Places a yellow line segment connecting (61, 142) to (206, 62).
; PLAN: r0=61(x1), r1=142(y1), r2=206(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 142
LDI r2, 206
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
