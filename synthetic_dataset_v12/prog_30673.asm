; DESCRIPTION: Renders a white line between points (116, 13) and (291, 200).
; PLAN: r0=116(x1), r1=13(y1), r2=291(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 13
LDI r2, 291
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
