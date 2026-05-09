; DESCRIPTION: Renders a black line between points (238, 60) and (48, 115).
; PLAN: r0=238(x1), r1=60(y1), r2=48(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 60
LDI r2, 48
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
