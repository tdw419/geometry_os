; DESCRIPTION: Renders a green line between points (341, 132) and (281, 151).
; PLAN: r0=341(x1), r1=132(y1), r2=281(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 132
LDI r2, 281
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
