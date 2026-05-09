; DESCRIPTION: Places a yellow line segment connecting (206, 41) to (0, 56).
; PLAN: r0=206(x1), r1=41(y1), r2=0(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 41
LDI r2, 0
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
