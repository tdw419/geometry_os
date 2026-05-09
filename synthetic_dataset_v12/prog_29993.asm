; DESCRIPTION: Composite: Sets a single black pixel at (477, 88) then Renders a magenta box of size 22x108 starting at (365, 63).
; PLAN: r0=477(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=63(y), r7=22(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 63
LDI r7, 22
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
