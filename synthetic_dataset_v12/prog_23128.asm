; DESCRIPTION: Composite: Places a purple dot at position (162, 44) then Places a magenta 44x42 rectangle at position (156, 102).
; PLAN: r0=162(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=102(y), r7=44(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 102
LDI r7, 44
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
