; DESCRIPTION: Draws a white line from (245, 0) to (62, 118).
; PLAN: r0=245(x1), r1=0(y1), r2=62(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 0
LDI r2, 62
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
