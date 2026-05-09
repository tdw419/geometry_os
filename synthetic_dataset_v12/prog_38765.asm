; DESCRIPTION: Composite: Places a red dot at position (162, 98) then Places a yellow 86x16 rectangle at position (341, 159).
; PLAN: r0=162(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=159(y), r7=86(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 159
LDI r7, 86
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
