; DESCRIPTION: Renders a white line between points (297, 40) and (511, 12).
; PLAN: r0=297(x1), r1=40(y1), r2=511(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 40
LDI r2, 511
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
