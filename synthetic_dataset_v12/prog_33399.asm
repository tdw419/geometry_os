; DESCRIPTION: Renders a black line between points (161, 60) and (304, 9).
; PLAN: r0=161(x1), r1=60(y1), r2=304(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 60
LDI r2, 304
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
