; DESCRIPTION: Places a white line segment connecting (121, 10) to (454, 47).
; PLAN: r0=121(x1), r1=10(y1), r2=454(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 10
LDI r2, 454
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
