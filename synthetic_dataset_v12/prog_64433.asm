; DESCRIPTION: Places a white line segment connecting (443, 147) to (19, 86).
; PLAN: r0=443(x1), r1=147(y1), r2=19(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 147
LDI r2, 19
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
