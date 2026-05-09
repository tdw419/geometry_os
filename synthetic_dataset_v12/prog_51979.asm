; DESCRIPTION: Renders a white line between points (298, 198) and (308, 82).
; PLAN: r0=298(x1), r1=198(y1), r2=308(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 198
LDI r2, 308
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
