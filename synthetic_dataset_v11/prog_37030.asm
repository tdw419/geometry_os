; DESCRIPTION: Places a white line segment connecting (19, 231) to (65, 129).
; PLAN: r0=19(x1), r1=231(y1), r2=65(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 231
LDI r2, 65
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
