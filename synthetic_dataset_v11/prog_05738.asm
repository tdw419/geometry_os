; DESCRIPTION: Places a white line segment connecting (3, 231) to (125, 28).
; PLAN: r0=3(x1), r1=231(y1), r2=125(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 231
LDI r2, 125
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
