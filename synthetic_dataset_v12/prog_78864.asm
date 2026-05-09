; DESCRIPTION: Renders a red line between points (507, 32) and (164, 12).
; PLAN: r0=507(x1), r1=32(y1), r2=164(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 32
LDI r2, 164
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
