; DESCRIPTION: Places a white line segment connecting (241, 74) to (212, 206).
; PLAN: r0=241(x1), r1=74(y1), r2=212(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 74
LDI r2, 212
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
