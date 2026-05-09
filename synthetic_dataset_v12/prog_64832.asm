; DESCRIPTION: Composite: Places a orange dot at position (103, 123) then Creates a magenta rectangular region at (273, 10) spanning 90 by 10 pixels.
; PLAN: r0=103(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=10(y), r7=90(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 273
LDI r6, 10
LDI r7, 90
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
