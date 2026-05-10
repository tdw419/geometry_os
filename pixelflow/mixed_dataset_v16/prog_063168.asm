; DESCRIPTION: Renders a orange line between points (96, 46) and (73, 240).
; PLAN: r0=96(x1), r1=46(y1), r2=73(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 46
LDI r2, 73
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
