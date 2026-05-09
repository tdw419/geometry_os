; DESCRIPTION: Composite: Sets a single orange pixel at (156, 120) then Renders a orange box of size 12x108 starting at (322, 97).
; PLAN: r0=156(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=97(y), r7=12(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 322
LDI r6, 97
LDI r7, 12
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
