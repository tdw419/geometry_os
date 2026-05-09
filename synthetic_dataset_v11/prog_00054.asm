; DESCRIPTION: Composite: . Then Sets a single purple pixel at (198, 179). Then Renders a orange disk with center (27, 220) and radius 22.
; PLAN: r0=198(x), r1=179(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=27(x), r1=220(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (198, 179).
; PLAN: r0=198(x), r1=179(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 179
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (27, 220) and radius 22.
; PLAN: r0=27(x), r1=220(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 220
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
