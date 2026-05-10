; DESCRIPTION: Renders a black line between points (151, 157) and (153, 87).
; PLAN: r0=151(x1), r1=157(y1), r2=153(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 157
LDI r2, 153
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
