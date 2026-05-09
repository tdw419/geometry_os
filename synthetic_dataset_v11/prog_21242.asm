; DESCRIPTION: Renders a green line between points (26, 222) and (50, 190).
; PLAN: r0=26(x1), r1=222(y1), r2=50(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 222
LDI r2, 50
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
