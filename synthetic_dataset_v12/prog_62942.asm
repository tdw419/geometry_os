; DESCRIPTION: Renders a red line between points (297, 55) and (504, 204).
; PLAN: r0=297(x1), r1=55(y1), r2=504(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 55
LDI r2, 504
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
