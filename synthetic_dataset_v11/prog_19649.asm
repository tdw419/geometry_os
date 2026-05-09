; DESCRIPTION: Places a white line segment connecting (70, 50) to (69, 35).
; PLAN: r0=70(x1), r1=50(y1), r2=69(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 50
LDI r2, 69
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
