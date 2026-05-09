; DESCRIPTION: Composite: . Then Renders a green box of size 27x89 starting at (81, 7). Then Sets a single blue pixel at (5, 1).
; PLAN: r0=81(x), r1=7(y), r2=27(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=5(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 27x89 starting at (81, 7).
; PLAN: r0=81(x), r1=7(y), r2=27(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 7
LDI r2, 27
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (5, 1).
; PLAN: r0=5(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
