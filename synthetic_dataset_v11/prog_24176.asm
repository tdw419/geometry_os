; DESCRIPTION: Renders a green line between points (25, 111) and (118, 219).
; PLAN: r0=25(x1), r1=111(y1), r2=118(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 111
LDI r2, 118
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
