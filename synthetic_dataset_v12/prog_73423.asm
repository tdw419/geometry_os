; DESCRIPTION: Renders a yellow line between points (71, 29) and (90, 16).
; PLAN: r0=71(x1), r1=29(y1), r2=90(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 29
LDI r2, 90
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
