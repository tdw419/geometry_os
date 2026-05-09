; DESCRIPTION: Renders a green line between points (492, 225) and (72, 190).
; PLAN: r0=492(x1), r1=225(y1), r2=72(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 225
LDI r2, 72
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
