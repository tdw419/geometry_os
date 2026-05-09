; DESCRIPTION: Places a green line segment connecting (255, 165) to (125, 89).
; PLAN: r0=255(x1), r1=165(y1), r2=125(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 165
LDI r2, 125
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
