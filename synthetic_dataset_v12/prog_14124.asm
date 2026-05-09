; DESCRIPTION: Places a red line segment connecting (375, 166) to (241, 6).
; PLAN: r0=375(x1), r1=166(y1), r2=241(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 166
LDI r2, 241
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
