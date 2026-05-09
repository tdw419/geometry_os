; DESCRIPTION: Renders a red line between points (222, 64) and (327, 93).
; PLAN: r0=222(x1), r1=64(y1), r2=327(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 64
LDI r2, 327
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
