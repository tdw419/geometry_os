; DESCRIPTION: Renders a green line between points (184, 105) and (74, 150).
; PLAN: r0=184(x1), r1=105(y1), r2=74(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 105
LDI r2, 74
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
