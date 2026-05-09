; DESCRIPTION: Renders a white line between points (127, 83) and (248, 122).
; PLAN: r0=127(x1), r1=83(y1), r2=248(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 83
LDI r2, 248
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
