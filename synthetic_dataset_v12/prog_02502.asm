; DESCRIPTION: Renders a white line between points (139, 19) and (492, 30).
; PLAN: r0=139(x1), r1=19(y1), r2=492(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 19
LDI r2, 492
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
