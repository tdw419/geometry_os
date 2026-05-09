; DESCRIPTION: Renders a green line between points (50, 101) and (190, 45).
; PLAN: r0=50(x1), r1=101(y1), r2=190(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 101
LDI r2, 190
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
