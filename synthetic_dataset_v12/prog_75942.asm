; DESCRIPTION: Places a white line segment connecting (455, 101) to (436, 95).
; PLAN: r0=455(x1), r1=101(y1), r2=436(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 101
LDI r2, 436
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
