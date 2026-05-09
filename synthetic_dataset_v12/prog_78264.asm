; DESCRIPTION: Renders a orange line between points (200, 96) and (481, 171).
; PLAN: r0=200(x1), r1=96(y1), r2=481(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 96
LDI r2, 481
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
