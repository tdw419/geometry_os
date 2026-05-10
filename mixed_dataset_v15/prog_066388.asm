; DESCRIPTION: Renders a orange line between points (48, 57) and (471, 215).
; PLAN: r0=48(x1), r1=57(y1), r2=471(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 57
LDI r2, 471
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
