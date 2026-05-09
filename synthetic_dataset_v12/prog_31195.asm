; DESCRIPTION: Renders a red line between points (297, 117) and (509, 200).
; PLAN: r0=297(x1), r1=117(y1), r2=509(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 117
LDI r2, 509
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
