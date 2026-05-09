; DESCRIPTION: Renders a yellow line between points (255, 138) and (399, 153).
; PLAN: r0=255(x1), r1=138(y1), r2=399(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 138
LDI r2, 399
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
