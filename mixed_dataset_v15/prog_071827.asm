; DESCRIPTION: Renders a orange line between points (16, 223) and (266, 48).
; PLAN: r0=16(x1), r1=223(y1), r2=266(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 223
LDI r2, 266
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
