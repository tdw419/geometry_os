; DESCRIPTION: Renders a white line between points (198, 141) and (76, 9).
; PLAN: r0=198(x1), r1=141(y1), r2=76(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 141
LDI r2, 76
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
