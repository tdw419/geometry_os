; DESCRIPTION: Renders a green line between points (301, 99) and (315, 47).
; PLAN: r0=301(x1), r1=99(y1), r2=315(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 99
LDI r2, 315
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
