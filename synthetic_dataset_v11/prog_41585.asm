; DESCRIPTION: Draws a red line from (215, 78) to (134, 129).
; PLAN: r0=215(x1), r1=78(y1), r2=134(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 78
LDI r2, 134
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
