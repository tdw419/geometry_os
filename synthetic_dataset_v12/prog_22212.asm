; DESCRIPTION: Renders a cyan line between points (337, 13) and (507, 106).
; PLAN: r0=337(x1), r1=13(y1), r2=507(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 13
LDI r2, 507
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
