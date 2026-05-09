; DESCRIPTION: Composite: Sets a single orange pixel at (320, 246) then Places a yellow 114x52 rectangle at position (245, 201).
; PLAN: r0=320(x), r1=246(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=201(y), r7=114(width), r8=52(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 246
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 245
LDI r6, 201
LDI r7, 114
LDI r8, 52
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
