; DESCRIPTION: Composite: . Then Renders a black line between points (101, 127) and (13, 224). Then Sets a single yellow pixel at (81, 7).
; PLAN: r0=101(x1), r1=127(y1), r2=13(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (101, 127) and (13, 224).
; PLAN: r0=101(x1), r1=127(y1), r2=13(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 127
LDI r2, 13
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (81, 7).
; PLAN: r0=81(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
