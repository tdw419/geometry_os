; DESCRIPTION: Renders a yellow line between points (14, 205) and (73, 98).
; PLAN: r0=14(x1), r1=205(y1), r2=73(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 205
LDI r2, 73
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
