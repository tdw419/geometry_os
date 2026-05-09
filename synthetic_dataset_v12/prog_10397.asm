; DESCRIPTION: Composite: Places a purple dot at position (447, 251) then Renders a orange box of size 27x27 starting at (324, 94).
; PLAN: r0=447(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=94(y), r7=27(width), r8=27(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 94
LDI r7, 27
LDI r8, 27
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
