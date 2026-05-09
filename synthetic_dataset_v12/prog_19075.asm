; DESCRIPTION: Renders a white line between points (287, 164) and (507, 48).
; PLAN: r0=287(x1), r1=164(y1), r2=507(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 164
LDI r2, 507
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
