; DESCRIPTION: Renders a cyan line between points (155, 58) and (262, 151).
; PLAN: r0=155(x1), r1=58(y1), r2=262(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 58
LDI r2, 262
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
