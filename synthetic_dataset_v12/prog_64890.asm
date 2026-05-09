; DESCRIPTION: Renders a orange line between points (326, 202) and (32, 77).
; PLAN: r0=326(x1), r1=202(y1), r2=32(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 202
LDI r2, 32
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
