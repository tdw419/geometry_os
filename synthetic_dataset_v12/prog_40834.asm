; DESCRIPTION: Renders a green line between points (25, 104) and (198, 184).
; PLAN: r0=25(x1), r1=104(y1), r2=198(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 104
LDI r2, 198
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
