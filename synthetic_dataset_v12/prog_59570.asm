; DESCRIPTION: Composite: Sets a single purple pixel at (26, 247) then Creates a magenta rectangular region at (124, 161) spanning 114 by 26 pixels.
; PLAN: r0=26(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=161(y), r7=114(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 161
LDI r7, 114
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
