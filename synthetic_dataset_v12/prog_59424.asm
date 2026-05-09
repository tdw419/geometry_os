; DESCRIPTION: Renders a blue line between points (425, 83) and (459, 190).
; PLAN: r0=425(x1), r1=83(y1), r2=459(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 83
LDI r2, 459
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
