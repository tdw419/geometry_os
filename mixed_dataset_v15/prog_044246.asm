; DESCRIPTION: Renders a white line between points (286, 96) and (353, 101).
; PLAN: r0=286(x1), r1=96(y1), r2=353(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 96
LDI r2, 353
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
