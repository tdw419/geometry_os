; DESCRIPTION: Composite: . Then Renders a cyan box of size 80x36 starting at (97, 30). Then Sets a single magenta pixel at (10, 30).
; PLAN: r0=97(x), r1=30(y), r2=80(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=10(x), r1=30(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 80x36 starting at (97, 30).
; PLAN: r0=97(x), r1=30(y), r2=80(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 30
LDI r2, 80
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (10, 30).
; PLAN: r0=10(x), r1=30(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 30
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
