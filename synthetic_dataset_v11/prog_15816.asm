; DESCRIPTION: Composite: . Then Sets a single red pixel at (221, 158). Then Renders a green disk with center (94, 50) and radius 42.
; PLAN: r0=221(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=94(x), r1=50(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (221, 158).
; PLAN: r0=221(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a green disk with center (94, 50) and radius 42.
; PLAN: r0=94(x), r1=50(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 50
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
