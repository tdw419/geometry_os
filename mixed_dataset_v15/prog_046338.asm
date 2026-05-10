; DESCRIPTION: Places a white line segment connecting (446, 62) to (80, 162).
; PLAN: r0=446(x1), r1=62(y1), r2=80(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 62
LDI r2, 80
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
