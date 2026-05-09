; DESCRIPTION: Composite: Sets a single purple pixel at (61, 85) then Renders a cyan box of size 19x66 starting at (218, 173).
; PLAN: r0=61(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=173(y), r7=19(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 173
LDI r7, 19
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
