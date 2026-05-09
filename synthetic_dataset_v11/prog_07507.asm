; DESCRIPTION: Renders a yellow line between points (98, 149) and (28, 71).
; PLAN: r0=98(x1), r1=149(y1), r2=28(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 149
LDI r2, 28
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
