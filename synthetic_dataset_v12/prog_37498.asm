; DESCRIPTION: Renders a white line between points (363, 252) and (206, 62).
; PLAN: r0=363(x1), r1=252(y1), r2=206(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 252
LDI r2, 206
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
