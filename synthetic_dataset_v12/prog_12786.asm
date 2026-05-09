; DESCRIPTION: Draws a white line from (366, 8) to (62, 167).
; PLAN: r0=366(x1), r1=8(y1), r2=62(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 8
LDI r2, 62
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
