; DESCRIPTION: Places a yellow line segment connecting (268, 93) to (108, 41).
; PLAN: r0=268(x1), r1=93(y1), r2=108(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 93
LDI r2, 108
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
