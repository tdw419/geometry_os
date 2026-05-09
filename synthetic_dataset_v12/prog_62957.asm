; DESCRIPTION: Renders a orange line between points (288, 26) and (435, 171).
; PLAN: r0=288(x1), r1=26(y1), r2=435(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 26
LDI r2, 435
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
