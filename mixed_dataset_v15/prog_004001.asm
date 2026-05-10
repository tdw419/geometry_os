; DESCRIPTION: Renders a white line between points (246, 38) and (77, 60).
; PLAN: r0=246(x1), r1=38(y1), r2=77(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 38
LDI r2, 77
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
