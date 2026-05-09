; DESCRIPTION: Composite: Places a black dot at position (479, 86) then Places a magenta 46x114 rectangle at position (364, 122).
; PLAN: r0=479(x), r1=86(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=122(y), r7=46(width), r8=114(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 86
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 122
LDI r7, 46
LDI r8, 114
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
