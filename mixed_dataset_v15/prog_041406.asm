; DESCRIPTION: Renders a yellow line between points (94, 19) and (301, 83).
; PLAN: r0=94(x1), r1=19(y1), r2=301(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 19
LDI r2, 301
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
