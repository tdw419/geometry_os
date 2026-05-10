; DESCRIPTION: Composite: Sets a single orange pixel at (214, 23) then Renders a orange box of size 60x110 starting at (64, 93).
; PLAN: r0=214(x), r1=23(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=64(x), r6=93(y), r7=60(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 23
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 64
LDI r6, 93
LDI r7, 60
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
