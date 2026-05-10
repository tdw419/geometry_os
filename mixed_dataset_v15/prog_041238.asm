; DESCRIPTION: Composite: Places a magenta dot at position (134, 224) then Places a magenta 12x78 rectangle at position (286, 147).
; PLAN: r0=134(x), r1=224(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=147(y), r7=12(width), r8=78(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 224
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 286
LDI r6, 147
LDI r7, 12
LDI r8, 78
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
