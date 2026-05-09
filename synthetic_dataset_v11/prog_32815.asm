; DESCRIPTION: Composite: . Then Renders a yellow line between points (78, 4) and (71, 183). Then Sets a single cyan pixel at (20, 113).
; PLAN: r0=78(x1), r1=4(y1), r2=71(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (78, 4) and (71, 183).
; PLAN: r0=78(x1), r1=4(y1), r2=71(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 4
LDI r2, 71
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (20, 113).
; PLAN: r0=20(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 113
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
