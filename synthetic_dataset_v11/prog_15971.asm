; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (7, 35). Then Places a yellow 43x84 rectangle at position (190, 81).
; PLAN: r0=7(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=190(x), r1=81(y), r2=43(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (7, 35).
; PLAN: r0=7(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 43x84 rectangle at position (190, 81).
; PLAN: r0=190(x), r1=81(y), r2=43(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 81
LDI r2, 43
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
