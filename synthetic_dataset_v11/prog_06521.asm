; DESCRIPTION: Renders a yellow line between points (139, 143) and (197, 151).
; PLAN: r0=139(x1), r1=143(y1), r2=197(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 143
LDI r2, 197
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
