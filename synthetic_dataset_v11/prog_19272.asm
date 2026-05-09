; DESCRIPTION: Composite: . Then Renders a cyan box of size 14x25 starting at (170, 32). Then Sets a single black pixel at (144, 43).
; PLAN: r0=170(x), r1=32(y), r2=14(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=144(x), r1=43(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 14x25 starting at (170, 32).
; PLAN: r0=170(x), r1=32(y), r2=14(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 32
LDI r2, 14
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (144, 43).
; PLAN: r0=144(x), r1=43(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 43
LDI r2, 0x000000
PSET r0, r1, r2
HALT
