; DESCRIPTION: Places a green line segment connecting (411, 124) to (125, 239).
; PLAN: r0=411(x1), r1=124(y1), r2=125(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 124
LDI r2, 125
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
