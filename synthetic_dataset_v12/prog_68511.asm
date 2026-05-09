; DESCRIPTION: Composite: Places a magenta dot at position (318, 245) then Places a orange 32x12 rectangle at position (296, 240).
; PLAN: r0=318(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=240(y), r7=32(width), r8=12(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 240
LDI r7, 32
LDI r8, 12
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
