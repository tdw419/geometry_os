; DESCRIPTION: Renders a orange line between points (322, 32) and (67, 218).
; PLAN: r0=322(x1), r1=32(y1), r2=67(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 32
LDI r2, 67
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
