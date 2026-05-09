; DESCRIPTION: Composite: Sets a single red pixel at (204, 165) then Renders a purple box of size 43x82 starting at (268, 126).
; PLAN: r0=204(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=126(y), r7=43(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 165
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 126
LDI r7, 43
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
