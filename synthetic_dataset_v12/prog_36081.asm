; DESCRIPTION: Renders a white line between points (508, 139) and (340, 172).
; PLAN: r0=508(x1), r1=139(y1), r2=340(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 139
LDI r2, 340
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
