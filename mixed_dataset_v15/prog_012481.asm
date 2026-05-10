; DESCRIPTION: Renders a orange line between points (445, 121) and (476, 34).
; PLAN: r0=445(x1), r1=121(y1), r2=476(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 121
LDI r2, 476
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
