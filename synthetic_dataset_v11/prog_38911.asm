; DESCRIPTION: Renders a green line between points (167, 163) and (219, 35).
; PLAN: r0=167(x1), r1=163(y1), r2=219(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 163
LDI r2, 219
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
