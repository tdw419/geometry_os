; DESCRIPTION: Places a white line segment connecting (13, 125) to (409, 237).
; PLAN: r0=13(x1), r1=125(y1), r2=409(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 125
LDI r2, 409
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
