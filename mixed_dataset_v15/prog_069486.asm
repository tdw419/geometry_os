; DESCRIPTION: Renders a white line between points (457, 55) and (69, 38).
; PLAN: r0=457(x1), r1=55(y1), r2=69(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 55
LDI r2, 69
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
