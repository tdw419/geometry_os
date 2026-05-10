; DESCRIPTION: Places a white line segment connecting (296, 215) to (462, 217).
; PLAN: r0=296(x1), r1=215(y1), r2=462(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 215
LDI r2, 462
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
