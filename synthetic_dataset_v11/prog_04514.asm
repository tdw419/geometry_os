; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (86, 143) to (136, 169). Then Sets a single green pixel at (192, 45).
; PLAN: r0=86(x1), r1=143(y1), r2=136(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=45(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (86, 143) to (136, 169).
; PLAN: r0=86(x1), r1=143(y1), r2=136(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 143
LDI r2, 136
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (192, 45).
; PLAN: r0=192(x), r1=45(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 45
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
