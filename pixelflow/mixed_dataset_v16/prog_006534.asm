; DESCRIPTION: Renders a yellow line between points (210, 59) and (190, 23).
; PLAN: r0=210(x1), r1=59(y1), r2=190(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 59
LDI r2, 190
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
