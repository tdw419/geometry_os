; DESCRIPTION: Places a white line segment connecting (406, 134) to (435, 14).
; PLAN: r0=406(x1), r1=134(y1), r2=435(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 134
LDI r2, 435
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
