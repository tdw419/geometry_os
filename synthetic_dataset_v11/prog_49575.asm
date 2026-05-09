; DESCRIPTION: Composite: . Then Renders a red box of size 78x28 starting at (124, 116). Then Sets a single cyan pixel at (30, 196).
; PLAN: r0=124(x), r1=116(y), r2=78(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=30(x), r1=196(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 78x28 starting at (124, 116).
; PLAN: r0=124(x), r1=116(y), r2=78(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 116
LDI r2, 78
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (30, 196).
; PLAN: r0=30(x), r1=196(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 196
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
