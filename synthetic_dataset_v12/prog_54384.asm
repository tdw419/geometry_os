; DESCRIPTION: Composite: Places a magenta dot at position (421, 159) then Renders a cyan box of size 108x58 starting at (26, 77).
; PLAN: r0=421(x), r1=159(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=77(y), r7=108(width), r8=58(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 159
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 77
LDI r7, 108
LDI r8, 58
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
