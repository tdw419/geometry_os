; DESCRIPTION: Places a white line segment connecting (296, 240) to (273, 189).
; PLAN: r0=296(x1), r1=240(y1), r2=273(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 240
LDI r2, 273
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
