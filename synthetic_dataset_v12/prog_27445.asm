; DESCRIPTION: Renders a yellow line between points (432, 67) and (207, 50).
; PLAN: r0=432(x1), r1=67(y1), r2=207(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 67
LDI r2, 207
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
