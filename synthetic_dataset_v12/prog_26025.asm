; DESCRIPTION: Renders a white line between points (72, 143) and (67, 22).
; PLAN: r0=72(x1), r1=143(y1), r2=67(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 143
LDI r2, 67
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
