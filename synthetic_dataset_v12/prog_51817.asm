; DESCRIPTION: Renders a yellow line between points (252, 217) and (460, 161).
; PLAN: r0=252(x1), r1=217(y1), r2=460(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 217
LDI r2, 460
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
