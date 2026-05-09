; DESCRIPTION: Draws a white line from (67, 62) to (22, 18).
; PLAN: r0=67(x1), r1=62(y1), r2=22(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 62
LDI r2, 22
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
