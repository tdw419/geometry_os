; DESCRIPTION: Renders a green line between points (82, 65) and (190, 192).
; PLAN: r0=82(x1), r1=65(y1), r2=190(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 65
LDI r2, 190
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
