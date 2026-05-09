; DESCRIPTION: Renders a red line between points (74, 22) and (384, 115).
; PLAN: r0=74(x1), r1=22(y1), r2=384(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 22
LDI r2, 384
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
