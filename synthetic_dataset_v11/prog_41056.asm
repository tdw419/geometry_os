; DESCRIPTION: Renders a blue line between points (174, 31) and (67, 36).
; PLAN: r0=174(x1), r1=31(y1), r2=67(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 31
LDI r2, 67
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
