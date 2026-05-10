; DESCRIPTION: Renders a red line between points (384, 13) and (21, 202).
; PLAN: r0=384(x1), r1=13(y1), r2=21(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 13
LDI r2, 21
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
