; DESCRIPTION: Renders a green line segment connecting (365, 10) to (190, 55).
; PLAN: r0=365(x1), r1=10(y1), r2=190(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 10
LDI r2, 190
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
