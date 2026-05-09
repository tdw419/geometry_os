; DESCRIPTION: Composite: . Then Sets a single red pixel at (82, 213). Then Renders a green disk with center (192, 158) and radius 59.
; PLAN: r0=82(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=192(x), r1=158(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (82, 213).
; PLAN: r0=82(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 213
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a green disk with center (192, 158) and radius 59.
; PLAN: r0=192(x), r1=158(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 158
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
