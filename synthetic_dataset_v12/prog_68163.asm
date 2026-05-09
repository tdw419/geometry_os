; DESCRIPTION: Renders a white line between points (15, 150) and (347, 80).
; PLAN: r0=15(x1), r1=150(y1), r2=347(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 150
LDI r2, 347
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
