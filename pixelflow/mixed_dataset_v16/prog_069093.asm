; DESCRIPTION: Composite: Sets a single purple pixel at (395, 117) then Renders a green box of size 63x74 starting at (87, 95).
; PLAN: r0=395(x), r1=117(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=95(y), r7=63(width), r8=74(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 117
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 95
LDI r7, 63
LDI r8, 74
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
