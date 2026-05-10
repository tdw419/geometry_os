; DESCRIPTION: Composite: Sets a single green pixel at (256, 246) then Renders a green box of size 15x93 starting at (280, 64).
; PLAN: r0=256(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=64(y), r7=15(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 280
LDI r6, 64
LDI r7, 15
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
