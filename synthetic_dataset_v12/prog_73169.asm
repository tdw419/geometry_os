; DESCRIPTION: Renders a yellow line between points (461, 99) and (27, 255).
; PLAN: r0=461(x1), r1=99(y1), r2=27(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 99
LDI r2, 27
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
