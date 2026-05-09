; DESCRIPTION: Draws a green line from (318, 200) to (67, 218).
; PLAN: r0=318(x1), r1=200(y1), r2=67(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 200
LDI r2, 67
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
