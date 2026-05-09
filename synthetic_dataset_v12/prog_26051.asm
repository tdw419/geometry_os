; DESCRIPTION: Composite: Sets a single cyan pixel at (307, 159) then Creates a black rectangular region at (292, 128) spanning 47 by 101 pixels.
; PLAN: r0=307(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=128(y), r7=47(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 128
LDI r7, 47
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
