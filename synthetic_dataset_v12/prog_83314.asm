; DESCRIPTION: Places a white line segment connecting (493, 57) to (375, 167).
; PLAN: r0=493(x1), r1=57(y1), r2=375(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 57
LDI r2, 375
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
