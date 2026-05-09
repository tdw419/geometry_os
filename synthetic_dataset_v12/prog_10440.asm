; DESCRIPTION: Renders a blue line between points (134, 173) and (425, 78).
; PLAN: r0=134(x1), r1=173(y1), r2=425(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 173
LDI r2, 425
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
