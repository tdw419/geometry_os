; DESCRIPTION: Renders a orange line between points (187, 160) and (5, 223).
; PLAN: r0=187(x1), r1=160(y1), r2=5(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 160
LDI r2, 5
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
