; DESCRIPTION: Renders a orange line between points (396, 64) and (21, 143).
; PLAN: r0=396(x1), r1=64(y1), r2=21(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 64
LDI r2, 21
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
