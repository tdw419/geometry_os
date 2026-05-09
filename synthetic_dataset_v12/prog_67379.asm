; DESCRIPTION: Renders a orange line between points (209, 230) and (287, 28).
; PLAN: r0=209(x1), r1=230(y1), r2=287(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 230
LDI r2, 287
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
