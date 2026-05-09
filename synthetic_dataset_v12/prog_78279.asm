; DESCRIPTION: Renders a white line between points (436, 118) and (400, 128).
; PLAN: r0=436(x1), r1=118(y1), r2=400(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 118
LDI r2, 400
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
