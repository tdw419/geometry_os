; DESCRIPTION: Composite: . Then Renders a red box of size 100x60 starting at (132, 150). Then Sets a single cyan pixel at (20, 87).
; PLAN: r0=132(x), r1=150(y), r2=100(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=20(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 100x60 starting at (132, 150).
; PLAN: r0=132(x), r1=150(y), r2=100(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 150
LDI r2, 100
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (20, 87).
; PLAN: r0=20(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 87
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
