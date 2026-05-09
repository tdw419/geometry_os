; DESCRIPTION: Renders a yellow line between points (60, 190) and (189, 209).
; PLAN: r0=60(x1), r1=190(y1), r2=189(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 190
LDI r2, 189
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
