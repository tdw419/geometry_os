; DESCRIPTION: Renders a orange line between points (327, 159) and (280, 1).
; PLAN: r0=327(x1), r1=159(y1), r2=280(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 159
LDI r2, 280
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
