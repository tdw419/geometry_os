; DESCRIPTION: Renders a orange line between points (64, 86) and (383, 133).
; PLAN: r0=64(x1), r1=86(y1), r2=383(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 86
LDI r2, 383
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
