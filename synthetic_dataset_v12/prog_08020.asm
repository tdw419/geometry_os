; DESCRIPTION: Draws a white line from (211, 24) to (62, 64).
; PLAN: r0=211(x1), r1=24(y1), r2=62(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 24
LDI r2, 62
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
