; DESCRIPTION: Composite: . Then Renders a purple line between points (28, 46) and (32, 24). Then Sets a single orange pixel at (232, 37).
; PLAN: r0=28(x1), r1=46(y1), r2=32(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=232(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (28, 46) and (32, 24).
; PLAN: r0=28(x1), r1=46(y1), r2=32(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 46
LDI r2, 32
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (232, 37).
; PLAN: r0=232(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
