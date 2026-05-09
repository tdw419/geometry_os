; DESCRIPTION: Places a orange line segment connecting (127, 202) to (96, 193).
; PLAN: r0=127(x1), r1=202(y1), r2=96(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 202
LDI r2, 96
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
