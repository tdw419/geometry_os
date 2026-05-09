; DESCRIPTION: Composite: . Then Renders a magenta box of size 115x16 starting at (74, 25). Then Sets a single red pixel at (155, 143).
; PLAN: r0=74(x), r1=25(y), r2=115(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=155(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta box of size 115x16 starting at (74, 25).
; PLAN: r0=74(x), r1=25(y), r2=115(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 25
LDI r2, 115
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (155, 143).
; PLAN: r0=155(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
