; DESCRIPTION: Composite: . Then Sets a single white pixel at (0, 129). Then Draws a magenta rectangle at (153, 44) with width 43 and height 93.
; PLAN: r0=0(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=153(x), r1=44(y), r2=43(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (0, 129).
; PLAN: r0=0(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (153, 44) with width 43 and height 93.
; PLAN: r0=153(x), r1=44(y), r2=43(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 44
LDI r2, 43
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
