; DESCRIPTION: Renders a white line between points (507, 205) and (463, 120).
; PLAN: r0=507(x1), r1=205(y1), r2=463(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 205
LDI r2, 463
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
