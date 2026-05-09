; DESCRIPTION: Renders a orange line between points (69, 227) and (67, 177).
; PLAN: r0=69(x1), r1=227(y1), r2=67(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 227
LDI r2, 67
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
