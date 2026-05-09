; DESCRIPTION: Composite: . Then Renders a orange line between points (219, 86) and (21, 27). Then Sets a single purple pixel at (4, 90).
; PLAN: r0=219(x1), r1=86(y1), r2=21(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=4(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (219, 86) and (21, 27).
; PLAN: r0=219(x1), r1=86(y1), r2=21(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 86
LDI r2, 21
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (4, 90).
; PLAN: r0=4(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 90
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
