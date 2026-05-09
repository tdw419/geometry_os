; DESCRIPTION: Renders a orange line between points (230, 191) and (225, 121).
; PLAN: r0=230(x1), r1=191(y1), r2=225(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 191
LDI r2, 225
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
