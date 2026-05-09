; DESCRIPTION: Draws a yellow line from (67, 129) to (109, 33).
; PLAN: r0=67(x1), r1=129(y1), r2=109(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 129
LDI r2, 109
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
