; DESCRIPTION: Composite: Places a orange dot at position (93, 34) then Creates a purple rectangular region at (479, 3) spanning 30 by 58 pixels.
; PLAN: r0=93(x), r1=34(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=479(x), r6=3(y), r7=30(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 34
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 479
LDI r6, 3
LDI r7, 30
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
