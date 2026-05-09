; DESCRIPTION: Composite: . Then Sets a single orange pixel at (23, 192). Then Renders a cyan box of size 67x48 starting at (2, 190).
; PLAN: r0=23(x), r1=192(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=2(x), r1=190(y), r2=67(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (23, 192).
; PLAN: r0=23(x), r1=192(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 192
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 67x48 starting at (2, 190).
; PLAN: r0=2(x), r1=190(y), r2=67(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 190
LDI r2, 67
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
