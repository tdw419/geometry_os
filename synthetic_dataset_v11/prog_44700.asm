; DESCRIPTION: Composite: . Then Renders a cyan box of size 59x93 starting at (90, 15). Then Sets a single red pixel at (247, 50).
; PLAN: r0=90(x), r1=15(y), r2=59(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=247(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 59x93 starting at (90, 15).
; PLAN: r0=90(x), r1=15(y), r2=59(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 15
LDI r2, 59
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (247, 50).
; PLAN: r0=247(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
