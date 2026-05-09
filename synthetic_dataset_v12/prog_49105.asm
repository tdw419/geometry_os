; DESCRIPTION: Renders a white line between points (294, 77) and (378, 38).
; PLAN: r0=294(x1), r1=77(y1), r2=378(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 77
LDI r2, 378
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
