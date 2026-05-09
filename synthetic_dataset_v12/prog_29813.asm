; DESCRIPTION: Renders a white line between points (372, 8) and (507, 116).
; PLAN: r0=372(x1), r1=8(y1), r2=507(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 8
LDI r2, 507
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
