; DESCRIPTION: Composite: . Then Sets a single red pixel at (175, 198). Then Renders a purple line between points (255, 237) and (68, 23).
; PLAN: r0=175(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=255(x1), r1=237(y1), r2=68(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (175, 198).
; PLAN: r0=175(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (255, 237) and (68, 23).
; PLAN: r0=255(x1), r1=237(y1), r2=68(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 237
LDI r2, 68
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
