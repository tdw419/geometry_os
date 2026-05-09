; DESCRIPTION: Places a white line segment connecting (222, 221) to (6, 167).
; PLAN: r0=222(x1), r1=221(y1), r2=6(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 221
LDI r2, 6
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
