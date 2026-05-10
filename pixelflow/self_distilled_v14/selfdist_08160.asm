; DESCRIPTION: Draws a green line from (238, 78) to (67, 54).
; PLAN: r0=238(x1), r1=78(y1), r2=67(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 78
LDI r2, 67
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
