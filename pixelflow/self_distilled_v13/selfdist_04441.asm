; DESCRIPTION: Places 4 yellow circles at the corners of the screen.
; PLAN: r0=24(x1), r1=24(y1), r2=41(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 24
LDI r2, 41
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
