; DESCRIPTION: Renders a orange line between points (2, 29) and (131, 128).
; PLAN: r0=2(x1), r1=29(y1), r2=131(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 29
LDI r2, 131
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
