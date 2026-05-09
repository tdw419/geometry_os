; DESCRIPTION: Draws a white line from (184, 167) to (91, 170).
; PLAN: r0=184(x1), r1=167(y1), r2=91(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 167
LDI r2, 91
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
