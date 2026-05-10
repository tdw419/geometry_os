; DESCRIPTION: Renders a orange line between points (53, 107) and (38, 96).
; PLAN: r0=53(x1), r1=107(y1), r2=38(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 107
LDI r2, 38
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
