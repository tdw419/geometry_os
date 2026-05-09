; DESCRIPTION: Renders a white line between points (34, 50) and (178, 55).
; PLAN: r0=34(x1), r1=50(y1), r2=178(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 50
LDI r2, 178
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
