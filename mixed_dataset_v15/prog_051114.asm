; DESCRIPTION: Renders a yellow line between points (232, 27) and (269, 65).
; PLAN: r0=232(x1), r1=27(y1), r2=269(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 27
LDI r2, 269
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
