; DESCRIPTION: Renders a black line between points (299, 246) and (21, 251).
; PLAN: r0=299(x1), r1=246(y1), r2=21(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 246
LDI r2, 21
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
