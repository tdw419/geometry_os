; DESCRIPTION: Places a white line segment connecting (97, 16) to (488, 104).
; PLAN: r0=97(x1), r1=16(y1), r2=488(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 16
LDI r2, 488
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
