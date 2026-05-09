; DESCRIPTION: Composite: Sets a single orange pixel at (244, 57) then Renders a magenta box of size 90x76 starting at (376, 81).
; PLAN: r0=244(x), r1=57(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=81(y), r7=90(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 57
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 376
LDI r6, 81
LDI r7, 90
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
