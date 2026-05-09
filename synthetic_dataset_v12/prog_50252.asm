; DESCRIPTION: Renders a red line between points (37, 82) and (223, 151).
; PLAN: r0=37(x1), r1=82(y1), r2=223(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 82
LDI r2, 223
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
