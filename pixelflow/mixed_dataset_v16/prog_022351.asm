; DESCRIPTION: Renders a yellow line between points (338, 143) and (71, 40).
; PLAN: r0=338(x1), r1=143(y1), r2=71(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 143
LDI r2, 71
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
