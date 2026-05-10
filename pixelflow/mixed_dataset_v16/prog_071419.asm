; DESCRIPTION: Renders a red line between points (337, 126) and (507, 39).
; PLAN: r0=337(x1), r1=126(y1), r2=507(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 126
LDI r2, 507
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
