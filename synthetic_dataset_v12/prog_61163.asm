; DESCRIPTION: Composite: Places a blue dot at position (154, 97) then Places a magenta 29x101 rectangle at position (457, 98).
; PLAN: r0=154(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=98(y), r7=29(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 97
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 98
LDI r7, 29
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
