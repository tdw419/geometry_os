; DESCRIPTION: Places a white line segment connecting (154, 5) to (435, 85).
; PLAN: r0=154(x1), r1=5(y1), r2=435(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 5
LDI r2, 435
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
