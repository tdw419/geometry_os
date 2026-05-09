; DESCRIPTION: Composite: . Then Creates a red rectangular region at (26, 125) spanning 30 by 106 pixels. Then Sets a single red pixel at (190, 136).
; PLAN: r0=26(x), r1=125(y), r2=30(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=190(x), r1=136(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red rectangular region at (26, 125) spanning 30 by 106 pixels.
; PLAN: r0=26(x), r1=125(y), r2=30(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 125
LDI r2, 30
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (190, 136).
; PLAN: r0=190(x), r1=136(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 136
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
