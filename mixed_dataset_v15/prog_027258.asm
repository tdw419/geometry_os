; DESCRIPTION: Composite: Sets a single orange pixel at (292, 22) then Renders a cyan box of size 19x45 starting at (55, 97).
; PLAN: r0=292(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=55(x), r6=97(y), r7=19(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 55
LDI r6, 97
LDI r7, 19
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
