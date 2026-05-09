; DESCRIPTION: Renders a green line between points (74, 64) and (17, 157).
; PLAN: r0=74(x1), r1=64(y1), r2=17(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 64
LDI r2, 17
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
