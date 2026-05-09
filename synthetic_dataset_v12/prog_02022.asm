; DESCRIPTION: Places a white line segment connecting (53, 104) to (277, 18).
; PLAN: r0=53(x1), r1=104(y1), r2=277(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 104
LDI r2, 277
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
