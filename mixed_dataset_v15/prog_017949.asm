; DESCRIPTION: Renders a yellow line between points (383, 67) and (495, 245).
; PLAN: r0=383(x1), r1=67(y1), r2=495(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 67
LDI r2, 495
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
