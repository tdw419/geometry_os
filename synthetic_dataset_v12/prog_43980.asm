; DESCRIPTION: Renders a orange line between points (484, 176) and (367, 171).
; PLAN: r0=484(x1), r1=176(y1), r2=367(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 176
LDI r2, 367
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
