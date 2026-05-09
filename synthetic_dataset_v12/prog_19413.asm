; DESCRIPTION: Renders a blue line between points (492, 60) and (151, 115).
; PLAN: r0=492(x1), r1=60(y1), r2=151(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 60
LDI r2, 151
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
