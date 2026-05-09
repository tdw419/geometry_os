; DESCRIPTION: Composite: . Then Sets a single red pixel at (132, 213). Then Renders a white disk with center (128, 194) and radius 26.
; PLAN: r0=132(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=194(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (132, 213).
; PLAN: r0=132(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 213
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (128, 194) and radius 26.
; PLAN: r0=128(x), r1=194(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 194
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
