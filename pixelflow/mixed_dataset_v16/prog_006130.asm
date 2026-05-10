; DESCRIPTION: Places a white line segment connecting (456, 189) to (480, 104).
; PLAN: r0=456(x1), r1=189(y1), r2=480(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 189
LDI r2, 480
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
