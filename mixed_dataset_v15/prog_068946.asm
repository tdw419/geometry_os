; DESCRIPTION: Places a white line segment connecting (489, 228) to (62, 119).
; PLAN: r0=489(x1), r1=228(y1), r2=62(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 228
LDI r2, 62
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
