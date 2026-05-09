; DESCRIPTION: Places a green line segment connecting (125, 187) to (332, 55).
; PLAN: r0=125(x1), r1=187(y1), r2=332(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 187
LDI r2, 332
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
