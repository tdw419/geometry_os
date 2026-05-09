; DESCRIPTION: Renders a white line between points (38, 157) and (20, 35).
; PLAN: r0=38(x1), r1=157(y1), r2=20(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 157
LDI r2, 20
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
