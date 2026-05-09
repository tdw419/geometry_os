; DESCRIPTION: Renders a white line between points (363, 207) and (482, 63).
; PLAN: r0=363(x1), r1=207(y1), r2=482(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 207
LDI r2, 482
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
