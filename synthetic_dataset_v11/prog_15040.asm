; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (86, 248) to (67, 12). Then Sets a single magenta pixel at (188, 17).
; PLAN: r0=86(x1), r1=248(y1), r2=67(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=188(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (86, 248) to (67, 12).
; PLAN: r0=86(x1), r1=248(y1), r2=67(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 248
LDI r2, 67
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (188, 17).
; PLAN: r0=188(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
