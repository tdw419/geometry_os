; DESCRIPTION: Renders a yellow line between points (39, 116) and (208, 144).
; PLAN: r0=39(x1), r1=116(y1), r2=208(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 116
LDI r2, 208
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
