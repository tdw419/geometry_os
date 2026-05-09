; DESCRIPTION: Renders a white line between points (199, 220) and (190, 240).
; PLAN: r0=199(x1), r1=220(y1), r2=190(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 220
LDI r2, 190
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
