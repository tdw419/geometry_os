; DESCRIPTION: Places a white line segment connecting (75, 83) to (18, 5).
; PLAN: r0=75(x1), r1=83(y1), r2=18(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 83
LDI r2, 18
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
