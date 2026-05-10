; DESCRIPTION: Composite: Places a orange dot at position (494, 160) then Creates a yellow rectangular region at (167, 208) spanning 21 by 41 pixels.
; PLAN: r0=494(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=208(y), r7=21(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 167
LDI r6, 208
LDI r7, 21
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
