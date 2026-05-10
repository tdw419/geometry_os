; DESCRIPTION: Renders a white line between points (490, 0) and (117, 173).
; PLAN: r0=490(x1), r1=0(y1), r2=117(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 0
LDI r2, 117
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
