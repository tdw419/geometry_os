; DESCRIPTION: Renders a orange line between points (256, 15) and (437, 168).
; PLAN: r0=256(x1), r1=15(y1), r2=437(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 15
LDI r2, 437
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
