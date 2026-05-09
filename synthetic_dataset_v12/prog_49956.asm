; DESCRIPTION: Places a white line segment connecting (55, 125) to (46, 64).
; PLAN: r0=55(x1), r1=125(y1), r2=46(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 125
LDI r2, 46
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
