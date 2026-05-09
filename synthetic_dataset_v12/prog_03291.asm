; DESCRIPTION: Renders a white line between points (250, 207) and (87, 159).
; PLAN: r0=250(x1), r1=207(y1), r2=87(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 207
LDI r2, 87
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
