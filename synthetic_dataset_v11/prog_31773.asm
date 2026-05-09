; DESCRIPTION: Places a white line segment connecting (107, 108) to (158, 146).
; PLAN: r0=107(x1), r1=108(y1), r2=158(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 108
LDI r2, 158
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
