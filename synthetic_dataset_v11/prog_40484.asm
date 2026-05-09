; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (239, 11). Then Renders a green box of size 71x64 starting at (30, 80).
; PLAN: r0=239(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=30(x), r1=80(y), r2=71(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (239, 11).
; PLAN: r0=239(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 71x64 starting at (30, 80).
; PLAN: r0=30(x), r1=80(y), r2=71(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 80
LDI r2, 71
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
