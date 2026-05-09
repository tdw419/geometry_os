; DESCRIPTION: Renders a green line between points (222, 207) and (276, 22).
; PLAN: r0=222(x1), r1=207(y1), r2=276(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 207
LDI r2, 276
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
