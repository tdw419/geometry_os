; DESCRIPTION: Renders a white line between points (475, 233) and (364, 180).
; PLAN: r0=475(x1), r1=233(y1), r2=364(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 233
LDI r2, 364
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
