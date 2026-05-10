; DESCRIPTION: Renders a white line between points (438, 58) and (94, 37).
; PLAN: r0=438(x1), r1=58(y1), r2=94(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 58
LDI r2, 94
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
