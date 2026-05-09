; DESCRIPTION: Renders a yellow line between points (35, 96) and (429, 127).
; PLAN: r0=35(x1), r1=96(y1), r2=429(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 96
LDI r2, 429
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
