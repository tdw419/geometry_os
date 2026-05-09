; DESCRIPTION: Renders a orange line between points (28, 72) and (249, 128).
; PLAN: r0=28(x1), r1=72(y1), r2=249(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 72
LDI r2, 249
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
