; DESCRIPTION: Composite: Sets a single red pixel at (257, 85) then Renders a purple box of size 89x52 starting at (281, 144).
; PLAN: r0=257(x), r1=85(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=144(y), r7=89(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 85
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 281
LDI r6, 144
LDI r7, 89
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
