; DESCRIPTION: Renders a white line between points (400, 108) and (62, 241).
; PLAN: r0=400(x1), r1=108(y1), r2=62(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 108
LDI r2, 62
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
