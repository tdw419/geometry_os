; DESCRIPTION: Renders a white line between points (384, 13) and (119, 153).
; PLAN: r0=384(x1), r1=13(y1), r2=119(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 13
LDI r2, 119
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
