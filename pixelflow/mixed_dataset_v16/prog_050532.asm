; DESCRIPTION: Renders a orange line between points (449, 96) and (415, 90).
; PLAN: r0=449(x1), r1=96(y1), r2=415(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 96
LDI r2, 415
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
