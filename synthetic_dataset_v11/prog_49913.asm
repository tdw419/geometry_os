; DESCRIPTION: Renders a blue line between points (27, 50) and (25, 10).
; PLAN: r0=27(x1), r1=50(y1), r2=25(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 50
LDI r2, 25
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
