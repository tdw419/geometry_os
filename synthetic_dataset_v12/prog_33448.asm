; DESCRIPTION: Renders a white line between points (220, 220) and (297, 6).
; PLAN: r0=220(x1), r1=220(y1), r2=297(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 220
LDI r2, 297
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
