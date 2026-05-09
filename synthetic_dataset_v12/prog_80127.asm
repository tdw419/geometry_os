; DESCRIPTION: Places a white line segment connecting (277, 41) to (64, 163).
; PLAN: r0=277(x1), r1=41(y1), r2=64(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 41
LDI r2, 64
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
