; DESCRIPTION: Renders a white line between points (29, 119) and (344, 195).
; PLAN: r0=29(x1), r1=119(y1), r2=344(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 119
LDI r2, 344
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
