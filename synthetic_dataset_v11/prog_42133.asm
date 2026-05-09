; DESCRIPTION: Renders a green line between points (131, 127) and (120, 190).
; PLAN: r0=131(x1), r1=127(y1), r2=120(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 127
LDI r2, 120
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
