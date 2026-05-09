; DESCRIPTION: Renders a yellow line between points (212, 111) and (13, 151).
; PLAN: r0=212(x1), r1=111(y1), r2=13(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 111
LDI r2, 13
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
