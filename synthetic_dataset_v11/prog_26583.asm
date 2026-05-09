; DESCRIPTION: Renders a green line between points (34, 64) and (90, 131).
; PLAN: r0=34(x1), r1=64(y1), r2=90(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 64
LDI r2, 90
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
