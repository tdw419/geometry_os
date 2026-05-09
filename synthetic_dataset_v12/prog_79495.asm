; DESCRIPTION: Renders a white line between points (67, 21) and (143, 160).
; PLAN: r0=67(x1), r1=21(y1), r2=143(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 21
LDI r2, 143
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
