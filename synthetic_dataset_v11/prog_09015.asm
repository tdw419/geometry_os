; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (226, 6). Then Renders a purple line between points (62, 220) and (151, 18).
; PLAN: r0=226(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=62(x1), r1=220(y1), r2=151(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (226, 6).
; PLAN: r0=226(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (62, 220) and (151, 18).
; PLAN: r0=62(x1), r1=220(y1), r2=151(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 220
LDI r2, 151
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
