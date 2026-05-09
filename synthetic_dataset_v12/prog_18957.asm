; DESCRIPTION: Renders a white line between points (183, 167) and (423, 21).
; PLAN: r0=183(x1), r1=167(y1), r2=423(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 167
LDI r2, 423
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
