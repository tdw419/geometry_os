; DESCRIPTION: Renders a orange line between points (189, 230) and (307, 36).
; PLAN: r0=189(x1), r1=230(y1), r2=307(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 230
LDI r2, 307
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
