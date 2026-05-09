; DESCRIPTION: Renders a orange line between points (202, 35) and (96, 179).
; PLAN: r0=202(x1), r1=35(y1), r2=96(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 35
LDI r2, 96
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
