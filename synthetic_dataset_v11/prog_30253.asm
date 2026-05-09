; DESCRIPTION: Renders a green line between points (23, 190) and (226, 192).
; PLAN: r0=23(x1), r1=190(y1), r2=226(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 190
LDI r2, 226
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
