; DESCRIPTION: Renders a white line between points (31, 177) and (135, 67).
; PLAN: r0=31(x1), r1=177(y1), r2=135(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 177
LDI r2, 135
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
