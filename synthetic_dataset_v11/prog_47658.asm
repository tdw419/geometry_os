; DESCRIPTION: Places a green line segment connecting (150, 122) to (138, 200).
; PLAN: r0=150(x1), r1=122(y1), r2=138(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 122
LDI r2, 138
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
