; DESCRIPTION: Places a yellow line segment connecting (115, 228) to (43, 105).
; PLAN: r0=115(x1), r1=228(y1), r2=43(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 228
LDI r2, 43
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
