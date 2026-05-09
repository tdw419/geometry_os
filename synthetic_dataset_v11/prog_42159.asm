; DESCRIPTION: Composite: . Then Sets a single white pixel at (83, 253). Then Draws a green rectangle at (208, 32) with width 37 and height 81.
; PLAN: r0=83(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=208(x), r1=32(y), r2=37(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (83, 253).
; PLAN: r0=83(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 253
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (208, 32) with width 37 and height 81.
; PLAN: r0=208(x), r1=32(y), r2=37(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 32
LDI r2, 37
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
