; DESCRIPTION: Composite: . Then Places a red 91x28 rectangle at position (131, 103). Then Sets a single white pixel at (247, 9).
; PLAN: r0=131(x), r1=103(y), r2=91(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=247(x), r1=9(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 91x28 rectangle at position (131, 103).
; PLAN: r0=131(x), r1=103(y), r2=91(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 103
LDI r2, 91
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (247, 9).
; PLAN: r0=247(x), r1=9(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 9
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
