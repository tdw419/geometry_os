; DESCRIPTION: Renders a orange line between points (327, 81) and (449, 60).
; PLAN: r0=327(x1), r1=81(y1), r2=449(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 81
LDI r2, 449
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
