; DESCRIPTION: Composite: Places a white dot at position (386, 218) then Creates a magenta rectangular region at (44, 166) spanning 101 by 23 pixels.
; PLAN: r0=386(x), r1=218(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=166(y), r7=101(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 218
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 44
LDI r6, 166
LDI r7, 101
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
