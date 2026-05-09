; DESCRIPTION: Composite: Sets a single black pixel at (396, 209) then Places a cyan 58x100 rectangle at position (82, 54).
; PLAN: r0=396(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=54(y), r7=58(width), r8=100(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 209
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 82
LDI r6, 54
LDI r7, 58
LDI r8, 100
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
