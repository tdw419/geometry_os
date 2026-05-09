; DESCRIPTION: Renders a orange line between points (77, 151) and (299, 192).
; PLAN: r0=77(x1), r1=151(y1), r2=299(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 151
LDI r2, 299
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
